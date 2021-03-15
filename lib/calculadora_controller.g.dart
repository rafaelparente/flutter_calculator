// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculadora_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalculadoraController on CalculadoraControllerBase, Store {
  Computed<bool> _$canCalculateResultsComputed;

  @override
  bool get canCalculateResults => (_$canCalculateResultsComputed ??=
          Computed<bool>(() => super.canCalculateResults,
              name: 'CalculadoraControllerBase.canCalculateResults'))
      .value;
  Computed<bool> _$canClearOperationsComputed;

  @override
  bool get canClearOperations => (_$canClearOperationsComputed ??=
          Computed<bool>(() => super.canClearOperations,
              name: 'CalculadoraControllerBase.canClearOperations'))
      .value;
  Computed<String> _$operationTextComputed;

  @override
  String get operationText =>
      (_$operationTextComputed ??= Computed<String>(() => super.operationText,
              name: 'CalculadoraControllerBase.operationText'))
          .value;

  final _$operationsAtom = Atom(name: 'CalculadoraControllerBase.operations');

  @override
  ObservableList<String> get operations {
    _$operationsAtom.reportRead();
    return super.operations;
  }

  @override
  set operations(ObservableList<String> value) {
    _$operationsAtom.reportWrite(value, super.operations, () {
      super.operations = value;
    });
  }

  final _$resultsAtom = Atom(name: 'CalculadoraControllerBase.results');

  @override
  String get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(String value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$CalculadoraControllerBaseActionController =
      ActionController(name: 'CalculadoraControllerBase');

  @override
  void addToOrUpdateOperations(dynamic key) {
    final _$actionInfo = _$CalculadoraControllerBaseActionController
        .startAction(name: 'CalculadoraControllerBase.addToOrUpdateOperations');
    try {
      return super.addToOrUpdateOperations(key);
    } finally {
      _$CalculadoraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateResults() {
    final _$actionInfo = _$CalculadoraControllerBaseActionController
        .startAction(name: 'CalculadoraControllerBase.calculateResults');
    try {
      return super.calculateResults();
    } finally {
      _$CalculadoraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearOperations() {
    final _$actionInfo = _$CalculadoraControllerBaseActionController
        .startAction(name: 'CalculadoraControllerBase.clearOperations');
    try {
      return super.clearOperations();
    } finally {
      _$CalculadoraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
operations: ${operations},
results: ${results},
canCalculateResults: ${canCalculateResults},
canClearOperations: ${canClearOperations},
operationText: ${operationText}
    ''';
  }
}
