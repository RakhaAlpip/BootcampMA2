mixin Logger {
  void log(String message) {
    print('$message');
  }
}

mixin Spinner {
  void spin() {
    print('Spinning...');
  }
}

class Bola with Logger, Spinner {}

void main() {
  Bola bola = Bola();
  bola.log('This is a log message.');
  bola.spin();
}