import 'package:mobx/mobx.dart';

part 'calculadora_controller.g.dart';

class CalculadoraController = CalculadoraControllerBase with _$CalculadoraController;

abstract class CalculadoraControllerBase with Store {
  @observable
  ObservableList<String> operations = ObservableList.of([]);

  @observable
  String results = '';

  @computed
  bool get canCalculateResults =>
      operations.length % 2 == 1;

  @computed
  bool get canClearOperations =>
      operations.length > 0;

  @computed
  String get operationText =>
      operations.fold('', (previousValue, element) =>
      previousValue + element.toString());

  @action
  void addToOrUpdateOperations(key) {
    if (key is String) {
      if (operations.length == 0) return;
      if (num.tryParse(operations.last) == null) {
        operations.last = key;
      } else {
        operations.add(key);
      }
    } else {
      if (operations.length == 0 || num.tryParse(operations.last) == null) {
        operations.add(key.toString());
      } else if (operations.last.toString().length < 15) {
        operations.last = ((num.parse(operations.last) * 10) + key).toString();
      }
    }
  }

  @action
  void calculateResults() {
    List newResults = [num.parse(operations.first) * 1.0];
    for (int i = 2; i < operations.length; i += 2) {
      switch(operations[i-1]) {
        case '+':
          newResults.add(num.parse(operations[i]) * 1.0);
          break;
        case '-':
          newResults.add(num.parse(operations[i]) * -1.0);
          break;
        case '*':
          newResults.last *= num.parse(operations[i]);
          break;
        case '/':
          if (operations[i] == '0') {
            results = null;
            return;
          }
          newResults.last /= num.parse(operations[i]);
          break;
      }
    }
    results = newResults.fold(0.0, (previousValue, element) => previousValue + element).toString();
  }

  @action
  void clearOperations() {
    operations.clear();
    results = '';
  }
}
