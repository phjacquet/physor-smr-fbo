#include <Dense>
#include<iostream>
#include <QDebug>
#include <sstream>

using namespace std;
using namespace Eigen;
int main()
{
    stringstream message ;

   MatrixXd M(8,8);
   M << -5.74346334295163E-09, 0, 0, 0, 0, 0, 0, 0,
        1.56199265341954E-09, -6.93499117257943E-09, 0, 0, 0, 0, 0, 8.25993993755286E-10,
        0, 1.43808105066273E-09, -2.71952737369777E-09, 0, 0, 0, 0, 0,
        0, 0, 1.42707780036747E-09, -1.05604530010869E-08, 0, 0, 0, 0,
        0, 0, 0, 1.40510255901075E-09, -2.33815552218174E-09, 8.47560114260119E-10, 0, 0,
        0, 0, 0, 1.53434924325925E-09, 0, -6.28286769167015E-09, 0, 0,
        0, 9.11636371202355E-13, 0, 0, 0, 0, -7.3617684041897E-09, 0,
        0, 0, 0, 0, 5.86121410925034E-14, 0, 0, -9.80983531668765E-10;

   MatrixXd EVal = MatrixXd::Zero(8,8) ;
   for (int i=0;i<8;i++) EVal(i,i) = M(i,i) ;

   MatrixXd EV(8,8) ;


   for (int i=0;i<8;i++) {
         MatrixXd ev=MatrixXd::Zero(8,1);
         MatrixXd z=MatrixXd::Zero(8,1);
         MatrixXd p = (M-EVal(i,i)*MatrixXd::Identity(8,8)) ;
         FullPivLU<MatrixXd> lu(p) ;
         ev = lu.setThreshold(1E-3).kernel();
         cout << "For eigenvalue : "<<EVal(i,i)<<", the solution is:\n" << ev << endl;
         for (int j=0;j<8;j++) EV(j,i)=ev(j,0) ;
   }

   message<< "Here is the matrix M:\n" << M << endl;
   message << "The eigenvalues of M are:\n" << EVal << endl;
   message << "Here's a matrix whose columns are eigenvectors of M \n"
        << "corresponding to these eigenvalues:\n"
        << EV<< endl;

   MatrixXd EVinv=EV.inverse() ;
   MatrixXd Y(8,8);
   VectorXd Y0(8);
   Y0<< 19.0417080275468,
           3461.58208037613,
           1154.52882356494,
           241.529033402041,
           82.1800030662545,
           52.1141482859175,
           138.973149657891,
           26586.6325537828;
   VectorXd K(8);
   K=EVinv*Y0 ;
   //cout << "Norm Vector \n"
   //     << K << endl;
   MatrixXd Km = MatrixXd::Zero(8,8) ;
   for (int i=0;i<8;i++) Km(i,i)=K(i) ;
   Y=EV*Km ;
   message << "Exp. Mat. Bateman Solution \n"
        << Y << endl;
   qDebug()<<message.str().c_str() ;

}
