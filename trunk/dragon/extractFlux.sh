awk '
 BEGIN {recording=0;}
 ($0==" F L U X E S   A N D    R E A C T I O N    R A T E S")  {recording=0}
 (recording==1) {print $1 "\n" $5 "\n" $9 "\n" $13 "\n" $17 "\n" $21}
 ($0==" E N E R G Y   L I M I T S   (EV)") {recording=1}
 ' $1 

grep -A3 "G R O U P" $1 | awk '($1==1) {print $0}'

