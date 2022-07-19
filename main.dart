import 'dart:io';

void main(){
  print("enter number of equations ");
  var m = int.parse(stdin.readLineSync()!); // number of rows -> m
  print("enter number of variables ");
  var n = int.parse(stdin.readLineSync()!); // number of coloumns -> n

  List<List<int>> matA = [] ;
  List<List<int>> matB = [];


// getting co-efficient matrix Mat A values

  for(int i=0;i<m;i++){
    matA.add([]);
    for(int j=0;j<n;j++){
      matA[i].add(int.parse(stdin.readLineSync()!));
    }
  }

// getting constant matrix Mat B values

  for(int i=0;i<m;i++){
    matB.add([]);
    for(int j=0;j<n;j++){
      matB[i].add(int.parse(stdin.readLineSync()!));
    }
  }

  print(matA);
  print(matB);

/*
  for(int i=0;i<m;i++){
    for(int j=0;j<n;j++){
      print("${matA[i][j]} ");
    }
    print("\n");
  }  */

}