import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

// This is the class used by rest of your codebase
class Counter = _Counter with _$Counter;

// The store-class
abstract class _Counter with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }
}