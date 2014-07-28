LINKED_LIST
  LIBRARY GEOMS GEOM TRACKS TRACK SYS FLUX BURNUP
  EDITION DATABASE ISOT ;
MODULE
  GEO: SYBILT: LIB: SHI: ASM: FLU: EVO: EDI: COMPO: DELETE: END: ;

LIBRARY := LIB: ::
  NMIX 3 CTRA WIMS
    DEPL LIB: DRAGON FIL: DLIB_J3
    MIXS LIB: DRAGON FIL: DLIB_J3
  MIX 1 1500.0                        

Pu239 = 'Pu239' 2.1782E-03 1
Pu240 = 'Pu240' 7.2335E-04 1
Pu241 = 'Pu241' 1.5060E-04 1
Pu242 = 'Pu242' 5.1218E-05 1
Am241 = 'Am241' 3.2614E-05 1
Pu238 = 'Pu238' 1.1994E-05 1
U238 = 'U238' 1.6814E-02 1
U235 = 'U235' 8.9010E-05 1
O16 = 'O16' 3.9757E-02

  MIX 2 1300.0
Fe56 = 'Fe56' 4.9852E-02
Fe58 = 'Fe58' 1.5346E-04
Cr52 = 'Cr52' 1.3100E-02
Cr54 = 'Cr54' 3.6972E-04
Ni60 = 'Ni60' 2.9912E-03
Ni62 = 'Ni62' 4.1459E-04
Fe54 = 'Fe54' 3.1761E-03
Fe57 = 'Fe57' 1.1511E-03
Cr50 = 'Cr50' 6.7944E-04
Cr53 = 'Cr53' 1.4856E-03
Ni58 = 'Ni58' 7.7656E-03
Ni61 = 'Ni61' 1.2999E-04
Ni64 = 'Ni64' 1.0557E-04
Mn55 = 'Mn55' 1.3057E-03
Si = 'Si28' 9.3679E-04


  MIX 3 800.0
Na23 = 'Na23' 2.4874E-02
  
  ;


GEOM  := GEO: :: HEXCEL 2
  HBC COMPLETE REFL
         SIDE 0.56 
         RADIUS 0.0 0.368500 0.429260
         MIX  1 2 3
  SPLITR 4  2 
  ;
    
TRACK := SYBILT: GEOM ::
  TITLE 'REP'
  EDIT 1 MAXR 40 ;

LIBRARY := SHI: LIBRARY TRACK :: EDIT 0 NOLJ ;

SYS := ASM: LIBRARY TRACK ;

FLUX := FLU: SYS LIBRARY TRACK ::
  TYPE K B1 BUCK 1.61694E-03 ;

EDITION := EDI: LIBRARY TRACK FLUX ::
  EDIT 99 
  MICR ALL 
  COND 
  MERG COMP  SAVE  ;

BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK ::
  EDIT 3 DEPL 0. 0.001 DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 0.001 73. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 73. 146. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 146. 219. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 219. 292. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 292. 365. DAY POWR 70.89610455 ;

FLUX := FLU: SYS LIBRARY TRACK FLUX ::
  TYPE K B1 BUCK 1.61694E-03 ;

BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 365. 438. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 438. 511. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 511. 584. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 584. 657. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 657. 730. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 730. 803. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 803. 876. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 876. 949. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 949. 1022. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1022. 1095. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1095. 1168. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1168. 1241. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1241. 1314. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1314. 1387. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1387. 1460. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1460. 1533. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1533. 1606. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1606. 1679. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1679. 1752. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1752. 1825. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1825. 1898. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1898. 1971. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 1971. 2044. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2044. 2117. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2117. 2190. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2190. 2263. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2263. 2336. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2336. 2409. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2409. 2482. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2482. 2555. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2555. 2628. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2628. 2701. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2701. 2774. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2774. 2847. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2847. 2920. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2920. 2993. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 2993. 3066. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 3066. 3139. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 3139. 3212. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 3212. 3285. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 3285. 3358. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 3358. 3431. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 3431. 3504. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 3504. 3577. DAY POWR 70.89610455 ;
BURNUP LIBRARY := EVO: LIBRARY FLUX TRACK BURNUP ::
  EDIT 3 DEPL 3577. 3650. DAY POWR 70.89610455 ;

FLUX := FLU: SYS LIBRARY TRACK FLUX ::
  TYPE K B1 BUCK 1.61694E-03 ;

END: ;   

QUIT "LIST" .
