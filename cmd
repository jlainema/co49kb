#!/bin/sh

# ESC Q1!
# FNTB Af1
# SHIFT Zfa
# Ctl Fnk

# whole top line RE = RW0, RO = RW4
# whole second line RE = RW1, RO = RW5
# whole third line RE = RW2, RO = RW6
# while fourth line RE = RW3, RO = RW7

# whole top line CRE = RR0, CRO = RR4
# while second line CRE = RR1, CRO = RR5
# while third line CRE = RR2, CRO = RR6
# whole fourth line CRE = RR3, CRO = RR7

# CO in first block link to RR0 etc


# column 0.0
python easyeda-merge.py PCB-layout-1u.json 0 0 KF=KF_00,LI=LD,LO=LO_00,RI=RW0,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,KF-NAME=Esc > KF_00.json
python easyeda-merge.py PCB-layout-1u.json 9.375 75 KF=KF_01,LI=LO_00,LO=LO_01,RI=RW1,RE=RW1,RO=RW5,CRE=RR1,CRO=RR5,KF-NAME=Tab > KF_01.json
python easyeda-merge.py PCB-layout-1u.json 18.75 150 KF=KF_02,LI=LO_01,LO=LO_02,RI=RW2,RE=RW2,RO=RW6,CRE=RR2,CRO=RR6,KF-NAME=Shr > KF_02.json
python easyeda-merge.py PCB-layout-1u.json 0 225 KF=KF_03,LI=LO_02,LO=LO_03,RI=RW3,RE=RW3,RO=RW7,CRE=RR3,CRO=RR7,KF-NAME=Ctl > KF_03.json

# column 0.4, shift half more on wide keys to get the spacing right
python easyeda-merge.py PCB-layout-1u.json 75 0 KF=KF_04,LI=LO_05,LO=LO_04,RI=RW4,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,KF-NAME=Q1 > KF_04.json
python easyeda-merge.py PCB-layout-1u.json 93.75 75 KF=KF_05,LI=LO_06,LO=LO_05,RI=RW5,RE=RW1,RO=RW5,CRE=RR1,CRO=RR5,KF-NAME=Af1 > KF_05.json
python easyeda-merge.py PCB-layout-1u.json 112.5 150 KF=KF_06,LI=LO_07,LO=LO_06,RI=RW6,RE=RW2,RO=RW6,CRE=RR2,CRO=RR6,KF-NAME=Zf10 > KF_06.json
python easyeda-merge.py PCB-layout-1u.json 75 225 KF=KF_07,LI=LO_03,LO=LO_07,RI=RW7,RE=RW3,RO=RW7,CRE=RR3,CRO=RR7,KF-NAME=Fn > KF_07.json

python easyeda-merge.py KF_00.json KF_01.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_02.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_03.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_04.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_05.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_06.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_07.json 0 0 > KF_C0.json

python easyeda-merge.py KF_C0.json 0 0 CO=RR0 > KF_CO0.json

# column 1.0, all keys are in place, just add 1u
python easyeda-merge.py PCB-layout-1u.json 150 0 KF=KF_10,LI=LO_04,LO=LO_10,RI=RW0,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,KF-NAME=W2 > KF_10.json
python easyeda-merge.py PCB-layout-1u.json 168.75 75 KF=KF_11,LI=LO_10,LO=LO_11,RI=RW1,RE=RW1,RO=RW5,CRE=RR1,CRO=RR5,KF-NAME=Sf2 > KF_11.json
python easyeda-merge.py PCB-layout-1u.json 187.5 150 KF=KF_12,LI=LO_11,LO=LO_12,RI=RW2,RE=RW2,RO=RW6,CRE=RR2,CRO=RR6,KF-NAME=Xf11 > KF_12.json
python easyeda-merge.py PCB-layout-1u.json 150 225 KF=KF_13,LI=LO_12,LO=LO_13,RI=RW3,RE=RW3,RO=RW7,CRE=RR3,CRO=RR7,KF-NAME=Alt > KF_13.json

# column 1.4, space row 1.5u key, others equidistant
python easyeda-merge.py PCB-layout-1u.json 225 0 KF=KF_14,LI=LO_15,LO=LO_14,RI=RW4,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,KF-NAME=E3 > KF_14.json
python easyeda-merge.py PCB-layout-1u.json 243.75 75 KF=KF_15,LI=LO_16,LO=LO_15,RI=RW5,RE=RW1,RO=RW5,CRE=RR1,CRO=RR5,KF-NAME=Df3 > KF_15.json
python easyeda-merge.py PCB-layout-1u.json 262.5 150 KF=KF_16,LI=LO_17,LO=LO_16,RI=RW6,RE=RW2,RO=RW6,CRE=RR2,CRO=RR6,KF-NAME=Cf12 > KF_16.json
python easyeda-merge.py PCB-layout-1u.json 243.75 225 KF=KF_17,LI=LO_13,LO=LO_17,RI=RW7,RE=RW3,RO=RW7,CRE=RR3,CRO=RR7,KF-NAME=Spcl > KF_17.json

python easyeda-merge.py KF_10.json KF_11.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_12.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_13.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_14.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_15.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_16.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_17.json 0 0 > KF_C0.json

python easyeda-merge.py KF_C0.json 0 0 CO=RR1 > KF_CO1.json

# column 2.0, space row adds another 0.25u to align the double 1u space splitters
python easyeda-merge.py PCB-layout-1u.json 300 0 KF=KF_20,LI=LO_14,LO=LO_20,RI=RW0,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,KF-NAME=R4 > KF_20.json
python easyeda-merge.py PCB-layout-1u.json 318.75 75 KF=KF_21,LI=LO_20,LO=LO_21,RI=RW1,RE=RW1,RO=RW5,CRE=RR1,CRO=RR5,KF-NAME=Ff4 > KF_21.json
python easyeda-merge.py PCB-layout-1u.json 337.5 150 KF=KF_22,LI=LO_21,LO=LO_22,RI=RW2,RE=RW2,RO=RW6,CRE=RR2,CRO=RR6,KF-NAME=Vpause > KF_22.json
python easyeda-merge.py PCB-layout-1u.json 337.5 225 KF=KF_23,LI=LO_22,LO=LO_23,RI=RW3,RE=RW3,RO=RW7,CRE=RR3,CRO=RR7,KF-NAME=LT > KF_23.json

# column 2.4, everything is 1u
python easyeda-merge.py PCB-layout-1u.json 375 0 KF=KF_24,LI=LO_25,LO=LO_24,RI=RW4,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,KF-NAME=T5 > KF_24.json
python easyeda-merge.py PCB-layout-1u.json 393.75 75 KF=KF_25,LI=LO_26,LO=LO_25,RI=RW5,RE=RW1,RO=RW5,CRE=RR1,CRO=RR5,KF-NAME=Gf5 > KF_25.json
python easyeda-merge.py PCB-layout-1u.json 412.5 150 KF=KF_26,LI=LO_27,LO=LO_26,RI=RW6,RE=RW2,RO=RW6,CRE=RR2,CRO=RR6,KF-NAME=Binsrt > KF_26.json
python easyeda-merge.py PCB-layout-1u.json 412.5 225 KF=KF_27,LI=LO_23,LO=LO_27,RI=RW7,RE=RW3,RO=RW7,CRE=RR3,CRO=RR7,KF-NAME=GT > KF_27.json

python easyeda-merge.py KF_20.json KF_21.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_22.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_23.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_24.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_25.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_26.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_27.json 0 0 > KF_C0.json

python easyeda-merge.py KF_C0.json 0 0 CO=RR2 > KF_CO2.json

# column 3.0, space row adds 0.25u for the second space
python easyeda-merge.py PCB-layout-1u.json 450 0 KF=KF_30,LI=LO_24,LO=LO_30,RI=RW0,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,KF-NAME=Y6 > KF_30.json
python easyeda-merge.py PCB-layout-1u.json 468.75 75 KF=KF_31,LI=LO_30,LO=LO_31,RI=RW1,RE=RW1,RO=RW5,CRE=RR1,CRO=RR5,KF-NAME=Hf6 > KF_31.json
python easyeda-merge.py PCB-layout-1u.json 487.5 150 KF=KF_32,LI=LO_31,LO=LO_32,RI=RW2,RE=RW2,RO=RW6,CRE=RR2,CRO=RR6,KF-NAME=Nprtsc > KF_32.json
python easyeda-merge.py PCB-layout-1u.json 506.25 225 KF=KF_33,LI=LO_32,LO=LO_33,RI=RW3,RE=RW3,RO=RW7,CRE=RR3,CRO=RR7,KF-NAME=Spcr > KF_33.json

# column 3.4, space row adds the trailing 0.25 for the second space
python easyeda-merge.py PCB-layout-1u.json 525 0 KF=KF_34,LI=LO_35,LO=LO_34,RI=RW4,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,KF-NAME=U7 > KF_34.json
python easyeda-merge.py PCB-layout-1u.json 543.75 75 KF=KF_35,LI=LO_36,LO=LO_35,RI=RW5,RE=RW1,RO=RW5,CRE=RR1,CRO=RR5,KF-NAME=Jf7 > KF_35.json
python easyeda-merge.py PCB-layout-1u.json 562.5 150 KF=KF_36,LI=LO_37,LO=LO_36,RI=RW6,RE=RW2,RO=RW6,CRE=RR2,CRO=RR6,KF-NAME=Mor > KF_36.json
python easyeda-merge.py PCB-layout-1u.json 600 225 KF=KF_37,LI=LO_33,LO=LO_37,RI=RW7,RE=RW3,RO=RW7,CRE=RR3,CRO=RR7,KF-NAME=Cln > KF_37.json

python easyeda-merge.py KF_30.json KF_31.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_32.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_33.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_34.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_35.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_36.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_37.json 0 0 > KF_C0.json

python easyeda-merge.py KF_C0.json 0 0 CO=RR3 > KF_CO3.json


python easyeda-merge.py PCB-layout-1u.json 600 0 KF=KF_40,LI=LO_34,LO=LO_40,RI=RW0,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,KF-NAME=I8 > KF_40.json
python easyeda-merge.py PCB-layout-1u.json 618.75 75 KF=KF_41,LI=LO_40,LO=LO_41,RI=RW1,RE=RW1,RO=RW5,CRE=RR1,CRO=RR5,KF-NAME=Kf8 > KF_41.json
python easyeda-merge.py PCB-layout-1u.json 637.5 150 KF=KF_42,LI=LO_41,LO=LO_42,RI=RW2,RE=RW2,RO=RW6,CRE=RR2,CRO=RR6,KF-NAME=Div > KF_42.json
python easyeda-merge.py PCB-layout-1u.json 675 225 KF=KF_43,LI=LO_42,LO=LO_43,RI=RW3,RE=RW3,RO=RW7,CRE=RR3,CRO=RR7,KF-NAME=Quot > KF_43.json

python easyeda-merge.py PCB-layout-1u.json 675 0 KF=KF_44,LI=LO_45,LO=LO_44,RI=RW4,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,KF-NAME=O9 > KF_44.json
python easyeda-merge.py PCB-layout-1u.json 693.75 75 KF=KF_45,LI=LO_46,LO=LO_45,RI=RW5,RE=RW1,RO=RW5,CRE=RR1,CRO=RR5,KF-NAME=Lf9 > KF_45.json
python easyeda-merge.py PCB-layout-1u.json 731.25 150 KF=KF_46,LI=LO_47,LO=LO_46,RI=RW6,RE=RW2,RO=RW6,CRE=RR2,CRO=RR6,KF-NAME=Shr > KF_46.json
python easyeda-merge.py PCB-layout-1u.json 750 225 KF=KF_47,LI=LO_43,LO=LO_47,RI=RW7,RE=RW3,RO=RW7,CRE=RR3,CRO=RR7,KF-NAME=Left > KF_47.json

python easyeda-merge.py KF_40.json KF_41.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_42.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_43.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_44.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_45.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_46.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_47.json 0 0 > KF_C0.json

python easyeda-merge.py KF_C0.json 0 0 CO=RR4 > KF_CO4.json


# column 5.0, second row adds 0.375u, third row finishes 0.25.
python easyeda-merge.py PCB-layout-1u.json 750 0 KF=KF_50,LI=LO_44,LO=LO_50,RI=RW0,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,KF-NAME=P0 > KF_50.json
python easyeda-merge.py PCB-layout-1u.json 796.875 75 KF=KF_51,LI=LO_50,LO=LO_51,RI=RW1,RE=RW1,RO=RW5,CRE=RR1,CRO=RR5,KF-NAME=Enter > KF_51.json
python easyeda-merge.py PCB-layout-1u.json 825 150 KF=KF_52,LI=LO_51,LO=LO_52,RI=RW2,RE=RW2,RO=RW6,CRE=RR2,CRO=RR6,KF-NAME=Up > KF_52.json
python easyeda-merge.py PCB-layout-1u.json 825 225 KF=KF_53,LI=LO_52,LO=LO_53,RI=RW3,RE=RW3,RO=RW7,CRE=RR3,CRO=RR7,KF-NAME=Down > KF_53.json

# column 5.4, top row adds 1u, second finishes 0.375u, others 1u
python easyeda-merge.py PCB-layout-1u.json 900 0 KF=KF_54,LI=LO_55,LO=LO_54,RI=RW4,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,KF-NAME=Bro > KF_54.json
python easyeda-merge.py PCB-layout-1u.json 900 75 KF=KF_55,LI=LO_56,LO=LO_55,RI=RW5,RE=RW1,RO=RW5,CRE=RR1,CRO=RR5,KF-NAME=Brc > KF_55.json
python easyeda-merge.py PCB-layout-1u.json 900 150 KF=KF_56,LI=LO_57,LO=LO_56,RI=RW6,RE=RW2,RO=RW6,CRE=RR2,CRO=RR6,KF-NAME=SwpFn > KF_56.json
python easyeda-merge.py PCB-layout-1u.json 900 225 KF=KF_57,LI=LO_53,LO=LO_57,RI=RW7,RE=RW3,RO=RW7,CRE=RR3,CRO=RR7,KF-NAME=Right > KF_57.json

python easyeda-merge.py KF_50.json KF_51.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_52.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_53.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_54.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_55.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_56.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_57.json 0 0 > KF_C0.json

python easyeda-merge.py KF_C0.json 0 0 CO=RR5 > KF_CO5.json

#column 6 - this is just the single backspace key
python easyeda-merge.py PCB-layout-1u.json 825 0 KF=KF_60,LI=LO_54,LO=LG,RI=RW0,RE=RW0,RO=RW4,CRE=RR0,CRO=RR4,CO=RR6,KF-NAME=Del > KF_60.json

python easyeda-merge.py KF_CO0.json KF_CO1.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_CO2.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_CO3.json 0 0 > KF_C0.json
python easyeda-merge.py KF_C0.json KF_CO4.json 0 0 > KF_CT.json
python easyeda-merge.py KF_CT.json KF_CO5.json 0 0 > KF_C0.json

python easyeda-merge.py KF_C0.json KF_60.json 0 0 > Co49kb.json


cp Co49kb.json ~/storage/downloads/ || cp Co49kb.json /mnt/c/Users/juha/Downloads/ || cp Co49kb.json ~/Downloads/
