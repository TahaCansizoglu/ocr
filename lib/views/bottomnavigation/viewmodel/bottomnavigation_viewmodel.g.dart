// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottomnavigation_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomNavigationViewModel on _BottomNavigationViewModelBase, Store {
  Computed<Destination>? _$selectedDestinationComputed;

  @override
  Destination get selectedDestination => (_$selectedDestinationComputed ??=
          Computed<Destination>(() => super.selectedDestination,
              name: '_BottomNavigationViewModelBase.selectedDestination'))
      .value;

  final _$selectedDestinationIndexAtom =
      Atom(name: '_BottomNavigationViewModelBase.selectedDestinationIndex');

  @override
  int get selectedDestinationIndex {
    _$selectedDestinationIndexAtom.reportRead();
    return super.selectedDestinationIndex;
  }

  @override
  set selectedDestinationIndex(int value) {
    _$selectedDestinationIndexAtom
        .reportWrite(value, super.selectedDestinationIndex, () {
      super.selectedDestinationIndex = value;
    });
  }

  final _$_BottomNavigationViewModelBaseActionController =
      ActionController(name: '_BottomNavigationViewModelBase');

  @override
  void selectDestination(int index) {
    final _$actionInfo = _$_BottomNavigationViewModelBaseActionController
        .startAction(name: '_BottomNavigationViewModelBase.selectDestination');
    try {
      return super.selectDestination(index);
    } finally {
      _$_BottomNavigationViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDestinationIndex: ${selectedDestinationIndex},
selectedDestination: ${selectedDestination}
    ''';
  }
}
