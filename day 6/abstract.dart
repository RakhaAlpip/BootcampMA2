import 'mx.dart';

sealed abstract class Kendaraan {
  final String merk;

  Kendaraan({required this.merk});

  void maju();

  void berhenti();

  void mundur(){
  print("Kendaraan mundur");
  }

  int belokKiri(int a, int b) {
  int c = a + b;
    return c;
  }
}

class Mobil extends Kendaraan with Logger{ 
  Mobil({required super.merk});

  @override
  void berhenti() {
    print("berhenti");
  }

  @override
  void maju() {
    print("maju");
  }

  @override
  void mundur() {
    super.mundur();
    print("Mobil mundur");
  }

  @override
  int belokKiri(int a, int b) {
  int d = a* 2;
  int f = super.belokKiri(d, b);
  super.mundur();
  return f*2;
  }
}

class Motor implements Kendaraan {
  @override
  final String merk; 

  @override
  void berhenti() {
    print("Motor berhenti");
  }

  @override
  void maju() {
    print("Motor maju");
  }
}
void main() {
  // Kendaraan kendaraan = Kendaraan(); // Error: Cannot instantiate abstract class
  Mobil mobil = Mobil();
  mobil.belokKiri(4, 6);
}
