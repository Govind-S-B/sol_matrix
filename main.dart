/*TO-DO
-Matrix Multiplication Function , take two matrices and return a matrix [EASY] @Mriiki
-Transpose function , take a matrix return another matrix [EASY] @Mriiki
-Can someone also just test that row remover and column remover functiion [EASY] @Aasish
-If the column remover functions and row remover functions work can someone test the determinant function too [MEDIUM]
-if determinant works can someone also test the cofactor matrix function [MEDIUM]
*/

import 'dart:io';
import 'dart:math';

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

List<List<int>> M_rowRemover(List<List<int>> mat , int row_index){
  mat.removeAt(row_index);
  return mat;
}

List<List<int>> M_colRemover(List<List<int>> mat , int coloumn_index){
  int m = mat.length;
  
  for(int i=0;i<m;i++)
  mat[i].removeAt(coloumn_index);

  return mat;
}

int Determinant(List<List<int>> mat){
  if ((mat.length == 1) && (mat[0].length == 1)){
    return mat[0][0];
  }

  else {
    int d = 0;

    int m = mat.length;
    int n = mat[0].length;

    int i = 0;
    for(int j=0;j<n;j++){
      d += mat[i][j] * pow(-1,i+j).toInt() * Determinant(M_colRemover(M_rowRemover(mat, i),j));
    }
    
    return d;

  }
}

List<List<int>> CofactorM(List<List<int>> mat){

  int m = mat.length;
  int n = mat[0].length;
  List<List<int>> mat_cofactor = []; // output matrix 

  for(int i=0;i<m;i++){
    mat_cofactor.add([]);
    for(int j=0;j<n;j++){
      mat_cofactor[i].add( pow(-1,i+j).toInt() * Determinant(M_colRemover(M_rowRemover(mat, i),j)) );
    }
  }

  return mat_cofactor;  

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