void main() {
  String nama = 'Alfian';
  nama.toLowerCase();
  nama.toUpperCase();
  bool isTrue = nama.contains('al');
  nama.replaceAll('ian', 'ic');
  List<String> result = nama.split('');
  nama.addAnInStart();

  int angka = 10;
  angka.isEven;
  angka.isOdd;
  angka.addAnInStart();
  angka.toJson();
  
  double angkaDouble = 10.5;
  angkaDouble.round();
  angkaDouble.floor();
  angkaDouble.toInt();
  angkaDouble.toString();
}

extension StringEGG on String {
  String addAnInStart() => 'a.n $this';
}

extension IntEGG on int {
  String addAnInStart() => 'Number: $this';

  Map<String, dynamic> toJson() {
    return {'value': this};
  }
}