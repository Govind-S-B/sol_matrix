/*TO-DO
-Matrix Multiplication Function , take two matrices and return a matrix [EASY] @Mriiki
-Transpose function , take a matrix return another matrix [EASY] @Mriiki
-Determinant matrix (also includes row remover and coloumn remover function) [HEAVY]
-Cofactor matrix [HEAVY]
*/

import 'dart:io';

void Mprint(List<List<int>> mat){ // Matrix Print Function
  int m = mat.length;
  int n = mat[0].length;

    for(int i=0;i<m;i++){
    for(int j=0;j<n;j++){
      stdout.write("${mat[i][j]} ");
    }
    stdout.write("\n");
  }
}

void main(){

  print("enter number of equations ");
  var m = int.parse(stdin.readLineSync()!); // number of rows / equaition -> m (iterated by i)
  print("enter number of variables ");
  var n = int.parse(stdin.readLineSync()!); // number of coloumns / variables -> n (iterated by j)

  List<List<int>> matA = [];
  List<List<int>> matB = [];


// assuming the equations are of the standard form
// a1X + b1Y + .. = Constant

// getting co-efficient matrix Mat A values
  for(int i=0;i<m;i++){
    print("Enter co-efficients of equation ${i+1}");
    matA.add(stdin.readLineSync()!.split(" ").map(int.parse).toList());
  }
  
// getting constant matrix Mat B values
  for(int i=0;i<m;i++){
    print("Enter constant of equation ${i+1}");
    matB.add(stdin.readLineSync()!.split(" ").map(int.parse).toList());
  }

Mprint(matA);
Mprint(matB);

}