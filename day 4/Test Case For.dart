void main() {
  testForLoop();
}
void testForLoop(){
  print('Test Case: For Loop (Bilangan Genap)');
  int start = 2;
  int end = 30;
  int count = 0;

  for (int a = start; a <= end; a += 2) {
    if (a % 2 == 0) {
      print("$a adalah bilangan genap");
      count++;
    }
  }

  print('Total bilangan genap antara $start-$end: $count/n');
}