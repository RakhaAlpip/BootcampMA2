void main() {
  namaHari(1);
  namaHari(5);
  namaHari(9);
}

void namaHari(int nomor) {
  switch (nomor) {
    case 1:
      print("Senin");
      break;
    case 2:
      print("Selasa");
      break;
    case 3:
      print("Rabu");
      break;
    case 4:
      print("Kamis");
      break;
    case 5:
      print("Jumat");
      break;
    case 6:
      print("Sabtu");
      break;
    case 7:
      print("Minggu");
      break;
    default:
      print("Nomor hari tidak valid");
  }
}