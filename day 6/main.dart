import 'encap.dart';

void main() {
  RumahKita rumahSaya = RumahKita(warnaAtap: "Biru");
  rumahSaya.bukaPintu();
  rumahSaya.tambahPintu(3);

  RumahKita rumahKamu = RumahKita.merah(2);

  Mobil mobilsaya = Mobil();
  // setter
  mobilsaya.warna = "Hitam";
  // getter
  print(mobilsaya.warna);
}

class RumahKita {
  String warnaAtap = "Merah";
  int jumlahPintu = 4;

  // RumahKita(this.warnaAtap, this..jumlahPintu);

  RumahKita.merah(this.jumlahPintu) {
    warnaAtap = "Merah";
  }

  // RumahKita();
  RumahKita({this.warnaAtap = "Merah", this.jumlahPintu = 4});

  void bukaPintu() {
    print("Pintu Dibuka");

  void tambahPintu(int jumlahBaru) {
    jumlahPintu <= jumlahBaru;
  }

  }
}