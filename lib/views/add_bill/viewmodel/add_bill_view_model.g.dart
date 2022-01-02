// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_bill_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddBillViewModel on _AddBillViewModelBase, Store {
  final _$imageFileAtom = Atom(name: '_AddBillViewModelBase.imageFile');

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  final _$categoryAtom = Atom(name: '_AddBillViewModelBase.category');

  @override
  TextEditingController get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(TextEditingController value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$amountControllerAtom =
      Atom(name: '_AddBillViewModelBase.amountController');

  @override
  TextEditingController get amountController {
    _$amountControllerAtom.reportRead();
    return super.amountController;
  }

  @override
  set amountController(TextEditingController value) {
    _$amountControllerAtom.reportWrite(value, super.amountController, () {
      super.amountController = value;
    });
  }

  final _$taxControllerAtom = Atom(name: '_AddBillViewModelBase.taxController');

  @override
  TextEditingController get taxController {
    _$taxControllerAtom.reportRead();
    return super.taxController;
  }

  @override
  set taxController(TextEditingController value) {
    _$taxControllerAtom.reportWrite(value, super.taxController, () {
      super.taxController = value;
    });
  }

  final _$corporationControllerAtom =
      Atom(name: '_AddBillViewModelBase.corporationController');

  @override
  TextEditingController get corporationController {
    _$corporationControllerAtom.reportRead();
    return super.corporationController;
  }

  @override
  set corporationController(TextEditingController value) {
    _$corporationControllerAtom.reportWrite(value, super.corporationController,
        () {
      super.corporationController = value;
    });
  }

  final _$dateControllerAtom =
      Atom(name: '_AddBillViewModelBase.dateController');

  @override
  TextEditingController get dateController {
    _$dateControllerAtom.reportRead();
    return super.dateController;
  }

  @override
  set dateController(TextEditingController value) {
    _$dateControllerAtom.reportWrite(value, super.dateController, () {
      super.dateController = value;
    });
  }

  final _$billNoControllerAtom =
      Atom(name: '_AddBillViewModelBase.billNoController');

  @override
  TextEditingController get billNoController {
    _$billNoControllerAtom.reportRead();
    return super.billNoController;
  }

  @override
  set billNoController(TextEditingController value) {
    _$billNoControllerAtom.reportWrite(value, super.billNoController, () {
      super.billNoController = value;
    });
  }

  final _$cashTypeControllerAtom =
      Atom(name: '_AddBillViewModelBase.cashTypeController');

  @override
  TextEditingController get cashTypeController {
    _$cashTypeControllerAtom.reportRead();
    return super.cashTypeController;
  }

  @override
  set cashTypeController(TextEditingController value) {
    _$cashTypeControllerAtom.reportWrite(value, super.cashTypeController, () {
      super.cashTypeController = value;
    });
  }

  final _$getAndScanImageAsyncAction =
      AsyncAction('_AddBillViewModelBase.getAndScanImage');

  @override
  Future<void> getAndScanImage(ImageSource source) {
    return _$getAndScanImageAsyncAction
        .run(() => super.getAndScanImage(source));
  }

  @override
  String toString() {
    return '''
imageFile: ${imageFile},
category: ${category},
amountController: ${amountController},
taxController: ${taxController},
corporationController: ${corporationController},
dateController: ${dateController},
billNoController: ${billNoController},
cashTypeController: ${cashTypeController}
    ''';
  }
}
