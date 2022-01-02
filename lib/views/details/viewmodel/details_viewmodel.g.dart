// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsViewModel on _DetailsViewModelBase, Store {
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
  ObservableList<BillModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<BillModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_DetailsViewModelBaseActionController =
      ActionController(name: '_DetailsViewModelBase');

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
txt: ${txt},
list: ${list}
    ''';
  }
}
