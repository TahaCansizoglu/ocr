// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsViewModel on _DetailsViewModelBase, Store {
  final _$amountAtom = Atom(name: '_DetailsViewModelBase.amount');

  @override
  double get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(double value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$isOnClickAtom = Atom(name: '_DetailsViewModelBase.isOnClick');

  @override
  bool get isOnClick {
    _$isOnClickAtom.reportRead();
    return super.isOnClick;
  }

  @override
  set isOnClick(bool value) {
    _$isOnClickAtom.reportWrite(value, super.isOnClick, () {
      super.isOnClick = value;
    });
  }

  final _$isButtonTextExpensesAtom =
      Atom(name: '_DetailsViewModelBase.isButtonTextExpenses');

  @override
  bool get isButtonTextExpenses {
    _$isButtonTextExpensesAtom.reportRead();
    return super.isButtonTextExpenses;
  }

  @override
  set isButtonTextExpenses(bool value) {
    _$isButtonTextExpensesAtom.reportWrite(value, super.isButtonTextExpenses,
        () {
      super.isButtonTextExpenses = value;
    });
  }

  final _$txtAtom = Atom(name: '_DetailsViewModelBase.txt');

  @override
  String get txt {
    _$txtAtom.reportRead();
    return super.txt;
  }

  @override
  set txt(String value) {
    _$txtAtom.reportWrite(value, super.txt, () {
      super.txt = value;
    });
  }

  final _$listAtom = Atom(name: '_DetailsViewModelBase.list');

  @override
  List<BillModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<BillModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$expensesListAtom = Atom(name: '_DetailsViewModelBase.expensesList');

  @override
  ObservableList<BillModel> get expensesList {
    _$expensesListAtom.reportRead();
    return super.expensesList;
  }

  @override
  set expensesList(ObservableList<BillModel> value) {
    _$expensesListAtom.reportWrite(value, super.expensesList, () {
      super.expensesList = value;
    });
  }

  final _$earningsListAtom = Atom(name: '_DetailsViewModelBase.earningsList');

  @override
  ObservableList<BillModel> get earningsList {
    _$earningsListAtom.reportRead();
    return super.earningsList;
  }

  @override
  set earningsList(ObservableList<BillModel> value) {
    _$earningsListAtom.reportWrite(value, super.earningsList, () {
      super.earningsList = value;
    });
  }

  final _$_DetailsViewModelBaseActionController =
      ActionController(name: '_DetailsViewModelBase');

  @override
  void changeListFilter(String type) {
    final _$actionInfo = _$_DetailsViewModelBaseActionController.startAction(
        name: '_DetailsViewModelBase.changeListFilter');
    try {
      return super.changeListFilter(type);
    } finally {
      _$_DetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addList(BillModel item) {
    final _$actionInfo = _$_DetailsViewModelBaseActionController.startAction(
        name: '_DetailsViewModelBase.addList');
    try {
      return super.addList(item);
    } finally {
      _$_DetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeText() {
    final _$actionInfo = _$_DetailsViewModelBaseActionController.startAction(
        name: '_DetailsViewModelBase.changeText');
    try {
      return super.changeText();
    } finally {
      _$_DetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addBill() {
    final _$actionInfo = _$_DetailsViewModelBaseActionController.startAction(
        name: '_DetailsViewModelBase.addBill');
    try {
      return super.addBill();
    } finally {
      _$_DetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
amount: ${amount},
isOnClick: ${isOnClick},
isButtonTextExpenses: ${isButtonTextExpenses},
txt: ${txt},
list: ${list},
expensesList: ${expensesList},
earningsList: ${earningsList}
    ''';
  }
}
