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
  List<List<int>> matAB = [];


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

  for(int i=0;i<m;i++){ // forming [AB] matrix
    matAB.add([]);
    matAB[i].addAll(matA[i]);
    matAB[i].addAll(matB[i]);
  }

  // row reduction
  for(int i=0;i<m;i++){ // i basically goes through each diagonal , so i indicates row and coloumn of diagonal element 
    for(int j=i+1;j<m;j++){ // j indicates each row unde the main row where the element must be reduced to zero
    if(matAB[j][i]!=0){
      var term = matAB[j][i]/matAB[i][i]; // the term with which row above is multiplied to reduce the row
      for(int k=0;k<n;k++){ // k iterates through the coloumn of each jth row while reduction is being done
        matAB[j][k] = (matAB[j][k] - term*matAB[i][k]).round();
      }
    }
    }
  }

Mprint(matA);
print("");
Mprint(matB);
print("");
Mprint(matAB);

}