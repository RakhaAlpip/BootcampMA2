class Singleton {
  String _databaseName = "my_database.db";

  static final Singleton _instance = Singleton._internal();

  factory Singleton() {
    return _instance;
  }

  Singleton._internal();

  void showMessage() {
    print("Ini adalah instance tunggal dari kelas Singleton");
  }
}

void main() {
  Singleton singleton1 = Singleton(); // a
  Singleton singleton2 = Singleton(); // a

  if (identical(singleton1, singleton2)) {
    print("Kedua instance adalah sama (singleton berhasil)");
  } else {
    print("Instance berbeda (singleton gagal)");
  }

  singleton1.showMessage();
}

void main2() {
  Singleton singleton3 = Singleton(); // a
}