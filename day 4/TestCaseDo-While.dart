void main() {
  testDoWhileLoop();
}
void testDoWhileLoop(){
  print('Test Case: Do-While Loop (Simulasi Login)');

  const String passwordBenar = 'flutter123';
  List<String> percobaan = ['dart123', 'flutter12', 'flutter123'];
  int index = 0;
  bool sukses = false;

  do {
    String passwordCoba = percobaan[index];
    print('Mencoba password: $passwordCoba');

    if (passwordCoba == passwordBenar) {
      print('✅Login berhasil!');
      sukses = true;
    } else {
      print('❌Password salah!');
      index++;
    }
  }while (!sukses && index < percobaan.length);
}