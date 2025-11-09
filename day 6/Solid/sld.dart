class Mobil {
  final String jumlahRoda;

  Mobil({required this.jumlahRoda});

  void info() {
    print('Mobil memiliki $jumlahRoda');
  }

  void maju() {
    print('Mobil dengan $jumlahRoda maju');
  }
}

class MobilInfo extends Mobil {
  MobilInfo({required super.jumlahRoda});

  void info() {
    print('Mobil memiliki $jumlahRoda');
  }
}

class MobilMaju extends Mobil {
  MobilMaju({required super.jumlahRoda});

  void maju() {
    print('Mobil dengan $jumlahRoda 4');
  }
}