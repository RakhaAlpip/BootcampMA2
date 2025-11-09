abstract class Worker {
  void work();
  void eat();
  void sleep();
}

abstract class CanEat {
  void eat();
}
abstract class CanSleep {
  void sleep();
}
abstract class Canwork {
  void work();
}

class Programmer Worker {
  @override
  void eat() {
    print('Programmer is eating');
  }
}