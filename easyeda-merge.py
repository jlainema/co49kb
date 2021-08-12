# merge component_to component_from delta_x delta_y
import json,sys,re

if len(sys.argv) < 4:
  print ("Usage: <easy eda json to merge to> [optional merge from] DELTA_X DELTA_Y [optional NET=NEW_NAME,NET=... renames]")
  print ("For renames you can also use K=REGEXP:REPLACE where if K is in net/name, re.sub(REGEXP,REPLACE,name) is ran")
  sys.exit()
  
def relocs(s,da,loop=True,nidx=-1):
  nums = filter(None, re.split('([-]*\d+[.]*\d*)', s))
  nout = ""
  oa = da
  for ns in nums:
    try:
      n = float(ns)
      if da:
        nidx += 1
        if (nidx >= 0 and nidx < len(da)):
          n += da[nidx % len(da)]
        if (nidx == len(da)-1) and loop:
          nidx = -1
      if int(n) == n:
        n = str(int(n))
      else:
        n = "%.4f"%n
    except Exception as e:
      c = ns.strip()
      if c == "M" or c == "L":
        loop = c == "L"
        nidx = -1
      if c == "A":
        loop = False
        nidx = -6        
      n = ns
      pass
    nout += n
  return nout

guid = 100
def merges(sout,s,c="~"):
  global guid
  for ns in s:
    if len(sout) != 0:
      sout += c
    if ns[:3] == "gge":
      ns = "gge"+str(guid)
      guid += 1
    sout += ns
  return sout

def do_net(c,name):
  # print (c,name)
  if name in renames:
    return renames[name]
  for l in renames["$$reg"]:
    if l[0] in name:
      return l[1].sub(l[2],name)
  return name

def do_nop(sout,arr,l):
  return do_arr(merges(sout, arr[0:1]), arr[1:], l)

def do_track(sout,arr,l):
  # print ("TRACK", len(arr))
  arr[3] = do_net(arr[0],arr[3])
  arr[4] = relocs(arr[4], delta)
  return merges(sout, arr)

def do_arc(sout,arr,l):
  # print ("ARC", len(arr))
  arr[3] = do_net(arr[0],arr[3])
  arr[4] = relocs(arr[4], delta)
  # print l
  return merges(sout,arr)
  
def do_srg(sout,arr,l):
  # print ("SOLIDREGION", len(arr))
  arr[2] = do_net(arr[0],arr[2])
  arr[3] = relocs(arr[3], delta)
  # print l
  return merges(sout,arr)

def do_text(sout,arr,l):
  # print ("TEXT", len(arr))
  arr[2] = relocs(arr[2], delta)
  arr[3] = relocs(arr[3], delta, False, 0)
  arr[10] = do_net(arr[0],arr[10])
  arr[11] = relocs(arr[11], delta)
  # print l
  return merges(sout,arr)

def do_rect(sout,arr,l):
  # print ("RECT", len(arr))
  arr[1] = relocs(arr[1], delta)
  arr[2] = relocs(arr[2], delta, False, 0)
  arr[6] = do_net(arr[0],arr[6])
  arr[9] = relocs(arr[9], delta)
  if len(arr)>17:
    arr[18] = relocs(arr[18], delta)
  # print l
  return merges(sout,arr)

def do_via(sout,arr,l):
  # print ("VIA", len(arr))
  arr[1] = relocs(arr[1], delta)
  arr[2] = relocs(arr[2], delta, False, 0)
  arr[4] = do_net(arr[0],arr[4])
  # print l
  return merges(sout,arr)

def do_hole(sout,arr,l):
  # print ("HOLE", len(arr))
  arr[1] = relocs(arr[1], delta)
  arr[2] = relocs(arr[2], delta, False, 0)
  # print l
  return merges(sout,arr)

def do_ellipse(sout,arr,l):
  # print ("ELLIPSE", len(arr))
  arr[1] = relocs(arr[1], delta)
  arr[2] = relocs(arr[2], delta, False, 0)
  arr[6] = do_net(arr[0],arr[6])
  arr[18] = relocs(arr[18], delta)
  return merges(sout,arr)
  
def do_lib(sout,arr,l):
  # print ("LIB", len(arr))
  arr[1] = relocs(arr[1], delta)
  arr[2] = relocs(arr[2], delta, False, 0)
  return merges(sout,arr)
  
def do_arr(sout,arr,l):
  if not arr[0] in found:
    print ("!!!", arr[0], str(arr))
    sys.exit()
  return found[arr[0]](sout,arr,l)
  
found = {"TRACK":do_track, "ARC":do_arc, "TEXT":do_text, "SOLIDREGION":do_srg, "RECT":do_rect, "VIA":do_via, "LIB":do_lib, "HOLE":do_hole, "CIRCLE":do_hole, "PAD":do_nop, "ELLIPSE":do_ellipse}

mto = json.loads(open(sys.argv[1]).read())
mfr = False
base = 3
try:
  mfr = json.loads(open(sys.argv[2]).read())
except Exception as e:
  base = 2

if not "shape" in mto:
  print ("need to have shapes to merge!")
  sys.exit()

delta = (float(sys.argv[base]),float(sys.argv[base+1]))
# print json.dumps(mto)

renames = {}
renames["$$reg"] = []
if len(sys.argv)>base+2:
  # get net renames, too
  ren = sys.argv[base+2].split(",")
  for v in ren:
    kv = v.split("=")
    if ":" in kv[1]:
      rv = kv[1].split(":")
      renames["$$reg"].append((rv[0],re.compile(rv[0]), rv[1]))
    else:
      renames[kv[0]] = kv[1]


if mfr:
  ns = mto["shape"]
  fr = mfr["shape"]
else:
  ns = []
  fr = mto["shape"]

for l in fr:
  marr = l.split("#@$")
  nl = ""
  was_object = False
  for s in marr:
    spl = s.split("~")
    if mfr and spl[0] == "TRACK" and spl[2]=="10":
      # do not propagate board outline when merging multiples TODO: merge outline poly 
      # sys.stderr.write("SKIPPING BOARD OUTLINE\n")
      # sys.stderr.flush()
      continue
    was_object = True
    nl += do_arr("",spl,s)
    nl += "#@$"
  if was_object:
    ns.append(nl[:-3]) # without the trailing #@$

mto["shape"] = ns
  
print (json.dumps(mto,indent=1))
