// Model
import 'enm.dart';

class Kendaraan {
  final String id;
  final String jenis;
  final int jumlahroda;
  final String warna;
  final JenisKendaraan jenisKendaraan;
  String? pemilik;

  Kendaraan({
    required this.id,
    required this.jenis,
    required this.jumlahroda,
    required this.warna,
    required this.jenisKendaraan,
    this.pemilik
  });

  set setPemilik(String namaPemilik) {
    pemilik = namaPemilik;
  }
}


void main() {
  Kendaraan mobil = Kendaraan(
    id: "K001",
    jenis: "Mobil",
    jumlahroda: 4,
    warna: "Merah",
    pemilik: "Joni",
    jenisKendaraan: JenisKendaraan.car
  );

  mobil.setPemilik = "Budi";
}