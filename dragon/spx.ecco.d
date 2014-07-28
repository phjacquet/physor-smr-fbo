

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


!---> modelisation ecco assemblage coeur interne spx :
!---> homogene (0d)
!---> heterogene cylindrique 2 zones (1d)
!---> heterogene assemblage (2d)
!--->
!---> 271 aiguilles par assemblage
!---> pastille       : diametre interne = 1.80 mm, externe 7.14 mm
!---> gaine          : diametre interne = 7.37 mm, externe 8.50 mm
!---> fil espaceur   : diametre = 1.20 mm, pas d'enroulement helicoidal = 180 mm
!---> tube hexagonal : entreplat interne = 163.8 mm, externe = 173.0 mm
!---> pas du reseau d'assemblages : 179.0 mm


PROCEDURE ->ASSEMBLAGE_SPX ;


* '     ***** ENTREE DANS ASSEMBLAGE_SPX *****' ;


CREATION_MILIEU ->EDL_MILIEU_AVANT_ECCO
   REFERENCE_UNIT        'BBL_REF'
   TEMPERATURE_INITIALE   20.0

   MATERIAU_SIMPLE 'UPUO2' COMBUSTIBLE  !---> combustible interne moyen
      POURCENTAGE_EN_POIDS 10.391
      ELEMENT CIA 13.924
         'Pu238'  0.381   'Pu239' 69.194   'Pu240' 22.978
         'Pu241'  4.784   'Pu242'  1.627   'Am241'  1.036
      ELEMENT CIP 74.323
         'U235'   0.520   'U238'  99.480
      ELEMENT CIP 11.753
         'O16'  100.0
 
   MATERIAU_SIMPLE 'ACIER316' STRUCTURE
      POURCENTAGE_EN_POIDS 7.95
      ELEMENT CIP 100.00
         'Fe54'  (63.45*0.05646)   'Fe56'  (63.45*0.91902)
         'Fe57'  (63.45*0.02160)   'Fe58'  (63.45*0.00293)
         'Cr50'  (17.00*0.04174)   'Cr52'  (17.00*0.83699)
         'Cr53'  (17.00*0.09674)   'Cr54'  (17.00*0.02453)
         'Ni58'  (14.00*0.67198)   'Ni60'  (14.00*0.26776)
         'Ni61'  (14.00*0.01183)   'Ni62'  (14.00*0.03835)
         'Ni64'  (14.00*0.01008)   'Mo92'   (2.75*0.14217)
         'Mo94'   (2.75*0.09055)   'Mo95'   (2.75*0.15750)
         'Mo96'   (2.75*0.16675)   'Mo97'   (2.75*0.09647)
         'Mo98'   (2.75*0.24627)   'Mo100'  (2.75*0.10029)
         'Ti46'   (0.40*0.07920)   'Ti47'   (0.40*0.07298)
         'Ti48'   (0.40*0.73845)   'Ti49'   (0.40*0.05532)
         'Ti50'   (0.40*0.05405)   'Cu63'   (0.35*0.68499)
         'Cu65'   (0.35*0.31501)   'Si28'   (0.55*0.91873)
         'Si29'   (0.55*0.04832)   'Si30'   (0.55*0.03295)
         'Mn55'        1.50

   MATERIAU_SIMPLE 'SODIUM' CALOPORTEUR
      POURCENTAGE_EN_POIDS 0.95
      CORPS 'Na23' 100.0

   MILIEU 'COMB'  !---> pastille diluee dans l'interieur gaine
      'UPUO2'  86.4916

   MILIEU 'COMB_E'  !---> acier+sodium hors interieur gaine (utile 1D)
      'ACIER316'  42.0712   'SODIUM'  57.9288

   MILIEU 'ACIER'
      'ACIER316' 100.00

   MILIEU 'CALO'
       'SODIUM'  100.00

   MILIEU 'CALO_EXT'  !---> differenciation utile si dilatations
      'SODIUM'   100.00

   CELLULE 'COEUR_2D'
      RANGEMENT_COMPOSITION 'COMB' 'ACIER' 'CALO' 'CALO_EXT'
      GEOMETRY DATA
         HEXAGON 3
            16.38 HEXLAT 10 0.97 2
               CYLINDRICAL 2
                  0.368500 REGION 1 'COMB' COMPOSITION 1 294                            
                  0.429260 REGION 2 'ACIER' COMPOSITION 2 294                          
                  INSIDE REGION 3 'CALO'  COMPOSITION 3 294 
               CYLINDRICAL 2
                  0.368500 REGION 4 'COMBP' COMPOSITION 1 294                            
                  0.429260 REGION 5 'ACIER' COMPOSITION 2 294                          
                  INSIDE REGION 6 'CALO'  COMPOSITION 3 294 
               1 1 1 1 1 1 1 1 1 2
               INSIDE REGION 7 'CALO' COMPOSITION 3 294
            17.30 REGION 8 'ACIER' COMPOSITION 2 294
            17.90 REGION 9 'CALOE' COMPOSITION 4 294  
         WHITE                                                                          
      END OF GEOMETRY DATA ;


!---> donnees pour calculs ecco :

->CONDENSATION
   CONDENSE 33
       1   82  142  202  262  322  382  442  502  564
     624  686  746  808  868  928  988 1048 1108 1168
    1228 1288 1336 1422 1480 1516 1579 1648 1708 1768
    1837 1919 1952 ;

->LISTE_NL_FIN
    'U235'   'U238'
    'Pu238'  'Pu239'  'Pu240'  'Pu241'  'Pu242'
    'Am241'
    'O16' ;

->LISTE_STRU_FIN
    'Fe54'   'Fe56'   'Fe57'   'Fe58'
    'Cr50'   'Cr52'   'Cr53'   'Cr54'
    'Ni58'   'Ni60'   'Ni61'   'Ni62'   'Ni64'
    'Mo92'   'Mo94'   'Mo95'   'Mo96'   'Mo97'   'Mo98'   'Mo100'
    'Ti46'   'Ti47'   'Ti48'   'Ti49'   'Ti50'
    'Si28'   'Si29'   'Si30'
    'Mn55'
    'Na23' ;

->LISTE_NL_LARGE
    'U235'   'U238'
    'Pu238'  'Pu239'  'Pu240'  'Pu241'  'Pu242'
    'Am241' ;
    

* 'calcul 3' ;
!---> calcul ecco, geometrie heterogene 2d, laplacien nul, route type projet :

ECCO
   MILIEU (EDL_MILIEU_AVANT_ECCO)
   REFERENCE_UNIT 'BBL_REF'
   CELLULE 'COEUR_2D'
      EDITION MOYENNE
      'COMBUSTIBLE INTERNE SPX HETEROGENE 2D B2=0 ROUTE PROJET'
      STEPS 5
         STEP GEOMETRY HOMOGENEOUS
              GROUP STRUCTURE OTHER 33
              INPUT LIBRARY 'BBL_33G'
              ELEMENTS ALL
              FLUX SOLUTION FM P1 CONSISTENT ORDER 1
              SELF SHIELDING NODBBSH
              BUCKLING 0.0
!              BSEARCH 1.0
         STEP GEOMETRY HOMOGENEOUS
              GROUP STRUCTURE FINE
              INPUT LIBRARY 'BBL_1968G'
              FIND_ELEMENTS_IN_LIST (LISTE_NL_FIN) (LISTE_STRU_FIN)
              FLUX SOLUTION FM P1 CONSISTENT ORDER 1
              SELF SHIELDING NODBBSH
              BFROM 1
              (CONDENSATION)
              PRINT DATA FLUXES
         STEP GEOMETRY ORIGINAL
              GROUP STRUCTURE OTHER 33
              INPUT LIBRARY 'BBL_33G'
              FIND_ELEMENTS_IN_LIST (LISTE_NL_LARGE)
              FLUX SOLUTION CP P1 CONSISTENT ORDER 1
              SELF SHIELDING NODBBSH
              LEAKAGE NLFACT CELL BENOIST FLUXWT MEAN
              BUCKLING 0.0
!              BSEARCH 1.0
              PROFILE COLLISION PROBABILITIES ROTH 6
              PRINT DATA FLUXES
         STEP HOMOGENISE
              GEOMETRY HOMOGENEOUS 
              GROUP STRUCTURE OTHER 33
              FLUX SOLUTION FM P1 CONSISTENT ORDER 1
              SELF SHIELDING NODBBSH
              BFROM 3
              PRINT DATA FLUXES
              OUTPUT LIBRARY 'COMB1_2D_P' CROSS SECTIONS FLUXES
         STEP GEOMETRY HOMOGENEOUS 
              GROUP STRUCTURE OTHER 33
              FLUX SOLUTION FM P1 CONSISTENT ORDER 1 
              SELF SHIELDING NODBBSH
              BFROM 3
              PRINT DATA FLUXES CROSS SECTIONS MICROSCOPIC VECTORS
      ENDSTEPS ;


* 'calcul 4' ;
!---> calcul ecco, geometrie heterogene 2d, laplacien nul, route type reference :

ECCO
   MILIEU (EDL_MILIEU_AVANT_ECCO)
   REFERENCE_UNIT 'BBL_REF'
   CELLULE 'COEUR_2D'
      EDITION MOYENNE
      'COMBUSTIBLE INTERNE SPX HETEROGENE 2D B2=0 ROUTE REFERENCE'
      STEPS 5
         STEP GEOMETRY ORIGINAL
              GROUP STRUCTURE OTHER 33
              INPUT LIBRARY 'BBL_33G'
              ELEMENTS ALL
              FLUX SOLUTION CP P1 CONSISTENT ORDER 1
              SELF SHIELDING NODBBSH
              LEAKAGE NLFACT CELL BENOIST FLUXWT MEAN
              BUCKLING 0.0
!              BSEARCH 1.0
              PROFILE COLLISION PROBABILITIES ROTH 6
         STEP GEOMETRY ORIGINAL
              GROUP STRUCTURE FINE
              INPUT LIBRARY 'BBL_1968G'
              FIND_ELEMENTS_IN_LIST (LISTE_NL_FIN) (LISTE_STRU_FIN)
              FLUX SOLUTION CP P1 CONSISTENT ORDER 1
              SELF SHIELDING NODBBSH
              LEAKAGE NLFACT CELL BENOIST FLUXWT MEAN
              BFROM 1
              PROFILE COLLISION PROBABILITIES ROTH 6
              (CONDENSATION)
              PRINT DATA FLUXES
         STEP GEOMETRY ORIGINAL
              GROUP STRUCTURE OTHER 33
              FLUX SOLUTION CP P1 CONSISTENT ORDER 1
              SELF SHIELDING NODBBSH
              LEAKAGE NLFACT CELL BENOIST FLUXWT MEAN
              BUCKLING 0.0
!              BSEARCH 1.0
              PROFILE COLLISION PROBABILITIES ROTH 6
              PRINT DATA FLUXES CROSS SECTIONS MICROSCOPIC VECTORS
         STEP HOMOGENISE
              GEOMETRY HOMOGENEOUS 
              GROUP STRUCTURE OTHER 33
              FLUX SOLUTION FM P1 CONSISTENT ORDER 1
              SELF SHIELDING NODBBSH
              BFROM 3
              PRINT DATA FLUXES
              OUTPUT LIBRARY 'COMB1_2D_R' CROSS SECTIONS FLUXES
         STEP GEOMETRY HOMOGENEOUS 
              GROUP STRUCTURE OTHER 33
              FLUX SOLUTION FM P1 CONSISTENT ORDER 1 
              SELF SHIELDING NODBBSH
              BFROM 3
              PRINT DATA FLUXES CROSS SECTIONS MICROSCOPIC VECTORS
      ENDSTEPS ;

* '     ***** SORTIE DE ASSEMBLAGE_SPX *****' ;


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

FINPROC ;

ASSEMBLAGE_SPX ;


FIN ;


