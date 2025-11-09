  void main() {
    cekAngka(7);
    cekAngka(12);
  }
  void cekAngka(int angka) {
    if (angka >= 1 && angka <= 10) {
      print("Angka $angka berada dalam rentang 1 hingga 10");
    } else {
      print("Angka $angka berada di luar rentang 1 hingga 10");
    }
  }