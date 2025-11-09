void main() {
  List<Map<String, dynamic>> dataKaryawan = [
    {
      'nama': 'Alice',
      'departemen': 'Pengembangan',
      'skorKinerja': 4.5,
      'jumlahProyek': 8,
      'tahunGabung': '2022',
      'statusPelatihan': true,
      'gajiPokok': 7000000
    },
    {
      'nama': 'Bob',
      'departemen': 'Pemasaran',
      'skorKinerja': 3.8,
      'jumlahProyek': 5,
      'tahunGabung': '2021',
      'statusPelatihan': false,
      'gajiPokok': 6500000
    },
    {
      'nama': 'Charlie',
      'departemen': 'Pengembangan',
      'skorKinerja': 4.9,
      'jumlahProyek': 10,
      'tahunGabung': '2023',
      'statusPelatihan': true,
      'gajiPokok': 8000000
    },
    {
      'nama': 'Diana',
      'departemen': 'HR',
      'skorKinerja': 4.2,
      'jumlahProyek': 3,
      'tahunGabung': '2022',
      'statusPelatihan': true,
      'gajiPokok': 6000000
    },
    {
      'nama': 'Eve',
      'departemen': 'Pemasaran',
      'skorKinerja': 3.5,
      'jumlahProyek': 6,
      'tahunGabung': '2023',
      'statusPelatihan': false,
      'gajiPokok': 6200000
    },
    {
      'nama': 'Frank',
      'departemen': 'Pengembangan',
      'skorKinerja': 4.7,
      'jumlahProyek': 9,
      'tahunGabung': '2021',
      'statusPelatihan': true,
      'gajiPokok': 7500000
    },
    {
      'nama': 'Grace',
      'departemen': 'HR',
      'skorKinerja': 3.0,
      'jumlahProyek': 2,
      'tahunGabung': '2024',
      'statusPelatihan': false,
      'gajiPokok': 5800000
    },
    {
      'nama': 'Heidi',
      'departemen': 'Pengembangan',
      'skorKinerja': 4.1,
      'jumlahProyek': 7,
      'tahunGabung': '2022',
      'statusPelatihan': true,
      'gajiPokok': 7200000
    },
  ];

  int totalGaji = 0;
  List<String> karyawanKinerjaAtas4 = [];
  int jumlahBelumPelatihan = 0;
  bool adaKinerjaSempurna = false;
  List<String> karyawanBelumPelatihan = [];
  int totalProyek = 0;
  double rataRataProyek = 0.0;
  List<String> karyawanPengembanganProyekAtasRata = [];

  for (var karyawan in dataKaryawan) {

    totalGaji += karyawan['gajiPokok'] as int;

    if (karyawan['skorKinerja'] > 4.0) {
      karyawanKinerjaAtas4.add(karyawan['nama']);
    }

    if (!(karyawan['statusPelatihan'] as bool)) {
      jumlahBelumPelatihan++;
      karyawanBelumPelatihan.add(karyawan['nama']);
    }

    if (karyawan['skorKinerja'] == 5.0) {
      adaKinerjaSempurna = true;
    }

    print('Nama: ${karyawan['nama']}, Departemen: ${karyawan['departemen']}, Skor Kinerja: ${karyawan['skorKinerja']}');

    totalProyek += karyawan['jumlahProyek'] as int;
  }

  rataRataProyek = totalProyek / dataKaryawan.length;

  for (var karyawan in dataKaryawan) {
    if (karyawan['departemen'] == 'Pengembangan' && karyawan['jumlahProyek'] > rataRataProyek) {
      karyawanPengembanganProyekAtasRata.add(karyawan['nama']);
    }
  }

  print('\nTotal gaji pokok departemen pengembangan: Rp$totalGaji');
  print('Karyawan berkinerja tinggi & lama bekerja: ${karyawanKinerjaAtas4.join(', ')}');
  print('Jumlah karyawan yang belum pelatihan: $jumlahBelumPelatihan');
  print('Ada karyawan dengan nilai kinerja sempurna 5.0: ${adaKinerjaSempurna ? 'Ya' : 'Tidak'}');
  print('Karyawan pengembangan dengan proyek di atas rata-rata: ${karyawanPengembanganProyekAtasRata.join(', ')}');
  print('Status pelatihan karyawan setelah pembaruan: ${karyawanBelumPelatihan.join(', ')}, Status pelatihan = ${karyawanBelumPelatihan}');
}
