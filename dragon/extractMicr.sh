for nucl in Pu239 Pu240 Pu241 Pu242 Am241 Pu238 U238 U235 O16 H1 H2 H3 He3 He4 Li6 Li7 Be9 B10 B11 N14 N15 O17 Ni60 Ni61 Ni62 Ni64 Cu63 Cu65 Ge72 Ge73 Ge74 Ge76 As75 Se76 Se77 Se78 Se79 Se80 Se82 Br79 Br81 Kr80 Kr82 Kr83 Kr84 Kr85 Kr86 Rb85 Rb87 Sr86 Sr87 Sr88 Sr89 Sr90 Y89 Y90 Y91 Zr90 Zr91 Zr92 Zr93 Zr94 Zr95 Zr96 Nb93 Nb94 Nb95 Mo94 Mo95 Mo96 Mo97 Mo98 Mo99 Mo100 Tc99 Ru99 Ru100 Ru101 Ru102 Ru103 Ru104 Ru105 Ru106 Rh103 Rh105 Pd104 Pd105 Pd106 Pd107 Pd108 Pd110 Ag107 Ag109 Ag110m Ag111 Cd106 Cd108 Cd110 Cd111 Cd112 Cd113 Cd114 Cd115m Cd116 In113 In115 Sn112 Sn114 Sn115 Sn116 Sn117 Sn118 Sn119 Sn120 Sn122 Sn123 Sn124 Sn125 Sn126 Sb121 Sb123 Sb124 Sb125 Sb126 Te122 Te123 Te124 Te125 Te126 Te127m Te128 Te129m Te130 Te131m Te132 I127 I129 I130 I131 I135 Xe128 Xe129 Xe130 Xe131 Xe132 Xe133 Xe134 Xe135 Xe136 Cs133 Cs134 Cs135 Cs136 Cs137 Ba134 Ba135 Ba136 Ba137 Ba138 Ba140 La139 La140 Ce140 Ce141 Ce142 Ce143 Ce144 Pr141 Pr142 Pr143 Nd142 Nd143 Nd144 Nd145 Nd146 Nd147 Nd148 Nd150 Pm147 Pm148m Pm149 Pm151 Sm147 Sm148 Sm149 Sm150 Sm151 Sm152 Sm153 Sm154 Eu151 Eu152 Eu153 Eu154 Eu155 Eu156 Eu157 Gd154 Gd155 Gd156 Gd157 Gd158 Gd160 Tb159 Tb160 Dy160 Dy161 Dy162 Dy163 Dy164 Dy165 Ho165 Er166 Er167 Hf176 Hf177 Hf178 Hf179 Hf180 W182 W183 W184 Pa231 U232 U233 U234 U236 U237 Np236 Np237 Np238 Np239 Pu236 Pu237 Pu243 Am242m Am243 Cm242 Cm243 Cm244 Cm245 Cm246 Cm247 Cm248 Bk249 Cf249 Cf250 Cf251 Cf252 Fe57 Fe58 Co59 Mo92 Hf174 Pb206 Pb207 Pb208 Bi209 Th230 Th232 Pa233 Cm241 Ti50 Cr52 Cr53 Cr54 Mn55 Fe56 Pb204 Ti47 Ti48 Ti49 Cr50 Ca44 Ca46 Ti46 Cl37 K41 Ca42 Ca43 S34 S36 Cl35 K39 K40 Ca40 P31 S32 S33 Si28 Si29 Si30 Mg25 Mg26 Al27 Na23 Mg24 
do
sigF=`awk ' 
BEGIN {inNucl=0; displayLastLine=0}
($1=="CROSS") {inNucl=0}
(displayLastLine==1) {print $0;  displayLastLine=0}
($1=="CROSS" && /'$nucl'/) {inNucl=1}
(inNucl==1 && /NFTOT / ) {displayLastLine=1}
' $1`

sigC=`awk ' 
BEGIN {inNucl=0; displayLastLine=0}
($1=="CROSS") {inNucl=0}
(displayLastLine==1) {print $0;  displayLastLine=0}
($1=="CROSS" && /'$nucl'/) {inNucl=1}
(inNucl==1 && /NG / ) {displayLastLine=1}
' $1`

sigNF=`awk ' 
BEGIN {inNucl=0; displayLastLine=0}
($1=="CROSS") {inNucl=0}
(displayLastLine==1) {print $0;  displayLastLine=0}
($1=="CROSS" && /'$nucl'/) {inNucl=1}
(inNucl==1 && /NUSIGF / ) {displayLastLine=1}
' $1`

echo "$nucl	$sigF	$sigC	$sigNF"

done
