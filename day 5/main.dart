import 'utils.dart';

void main() {
  greetNoParam();
  greetWithParam("Jono", 2, 4);
  String message = GetWelcomeMessage("Dev Kipip");
  print(message);
  int sum = addNumbers(5, 10);
  print("Sum: $sum");
  fulNameMerge("Kipip", "kupup", null, "kopop");
}

void greetNoParam() {
  print("Hello, Dev Kipip!");
}

void greetWithParam(String name, int count, int age) {
  print("Hello, $name!");
  print("count: ${count + age}");
}

String GetWelcomeMessage(String name) {
  String result = name.toUpperCase();
  return "Welcome, $name!";
}

int addNumbers(int a, int b) {
  return a * b;
}