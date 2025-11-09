void main() {
  List<int> angka = [1, 2, 3, 4, 5];
  int count = 0;

  for (int index = 0; index < angka.length; index++){
    count = count + angka[index];
  }

  print('total jumlah $count');

  print("=====================");

  List<String> daftarBuah = ['Apel', 'Mangga', 'Sirsak', 'Nanas'];

  for (String buah in daftarBuah) {
  print('Saya suka $buah');
  }

   print("=====================");

  Set<int> uniqueNumbers = {10, 20, 30};

  for (int number in uniqueNumbers) {
    print('Angka: $number');
  }

  Map<String, int> score = {
    'Bobby' : 90,
    'Andi' : 80,
    "Lintang": 70
  };

  print("=====================");

  for(dynamic data in score.keys){
    print('$data: ${score[data]}');
  }

  print("=====================");

  int counter = 0;

  while(counter < 5) {
    print("data $counter");
    counter++;
  }

  print("=====================");

  int i = 0;
  do {
    print('Do-While Iterasi ke-$i');
    i++;
}   while (i < 3);

  print("=====================");

  int j = 5;
  do {
    print('Ini akan dieksekusi satu kali, meskipun kondisi false, j $j');
    j++;
  } while (j < 5);

  print("=====================");

  List<int> numberic = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  for(int no in numberic){
    if(no == 6){
      print('Ketemu angka $no');
      break;
    }
    print('Angka nya &no');
  }

  print("=====================");

    for(int no in numberic){
    if(no == 6 || no == 2 || no == 8){
      continue;
    } else if (no == 11){
      print('Ketemu angka $no');
      break;
    }
    print('Angka nya &no');
  }
}