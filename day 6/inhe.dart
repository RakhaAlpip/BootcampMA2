class Motor {
  int jumlahRoda = 2;

  String jenisOli;

  Motor(this.jenisOli);
}

class YamahaMotor extends Motor {
  String merk ="Yamaha";
  String jumlahSpion;

  YamahaMotor(this.jumlahSpion) : super("Sintetik");

  void info() {
    print("Motor merk $merk, jumlah roda sepeda motor: $jumlahRoda");
  }
}

class HondaMotor extends Motor {
  String merk = "Honda";

  HondaMotor(super.jenisOli);

  void info() {
    print("Motor merk $merk, jumlah roda sepeda motor: $jumlahRoda");
  }
}

class KawasakiMotor extends Motor {
  String merk = "Yamaha";
  String jumlahSpion;

  KawasakiMotor(this.jumlahSpion, String jenisOli) : super(jenisOli);

  void info() {
    print("Motor merk $merk, jumlah roda sepeda motor: $jumlahRoda");
  }
}