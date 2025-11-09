void main() {
  testWhileLoop();
}
void testWhileLoop(){
  print('Test Case: While Loop (Menabung)');
  int saldo = 0;
  int target = 1000000;
  int minggu = 1;

  while (saldo < target) {
    int tabunganMingguan = 100000 + (minggu * 5000);
    saldo += tabunganMingguan;
    print("Minggu ke-$minggu : Nabung Rp$tabunganMingguan => Total Rp$saldo");
    minggu++;
  }
  print('Target Rp$target tercapai dalam ${minggu-1} minggu!/n');
}