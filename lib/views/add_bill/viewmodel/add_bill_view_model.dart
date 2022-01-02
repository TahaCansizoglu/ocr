import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/models/bill_model/bill_model.dart';
import '../../details/viewmodel/details_viewmodel.dart';

part 'add_bill_view_model.g.dart';

class AddBillViewModel = _AddBillViewModelBase with _$AddBillViewModel;

abstract class _AddBillViewModelBase with Store, BaseViewModel {
  @observable
  File? imageFile;
  bool isInitiated = false;
  final List<String> _billLines = [];
  @observable
  TextEditingController category = TextEditingController();
  @observable
  late TextEditingController amountController = TextEditingController();
  @observable
  late TextEditingController taxController = TextEditingController();
  @observable
  late TextEditingController corporationController = TextEditingController();
  @observable
  late TextEditingController dateController = TextEditingController();
  @observable
  late TextEditingController billNoController = TextEditingController();
  @observable
  late TextEditingController cashTypeController = TextEditingController();

  late final TextRecognizer _recognizer;
  late final numericRegex = RegExp(r'^(\d*[.,]\d{2}$)');
  List<String> sayilar = [];

  @action
  Future<void> getAndScanImage(ImageSource source) async {
    clearControllers();
    sayilar.clear();
    final XFile? pickedImage;
    final File imageFile;
    final _picker = ImagePicker();
    switch (source) {
      case ImageSource.camera:
        pickedImage = await _picker.pickImage(source: ImageSource.camera);

        break;
      case ImageSource.gallery:
        pickedImage = await _picker.pickImage(source: ImageSource.gallery);

        break;
      default:
        pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    }
    imageFile = File(pickedImage!.path);

    this.imageFile = imageFile;

    await _scanImage(imageFile);

    if (_billLines != null) {
      for (var item in _billLines) {
        print(numericRegex.hasMatch(item));
        if (item.contains("Fis No") ||
            item.contains("FIS NO") ||
            item.contains("FIs NO") ||
            item.contains("FIs No") ||
            item.contains("PIŞ NO") ||
            item.contains("FiS NO")) {
          billNoController.text = item.substring(item.length - 3, item.length);
        }
        if (item.contains("Tarih")) {
          int pos = item.indexOf(" ");
          dateController.text = item.substring(pos, item.length);
        }
        if (RegExp(
                r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$')
            .hasMatch(item)) {
          dateController.text = item;
        }
        if (item.contains("TL")) {
          cashTypeController.text = "TL";
        }
        if (numericRegex.hasMatch(item)) {
          sayilar.add(item);
        }
        print(item.contains(numericRegex));
      }
      if (cashTypeController.text.isEmpty) {
        cashTypeController.text = "TL";
      }
      corporationController.text = _billLines[0];
      sayilar.sort();
      amountController.text = sayilar[sayilar.length - 1].toString();
    }
  }

  Future<void> _scanImage(File imageFile) async {
    final GoogleVisionImage visionImage = GoogleVisionImage.fromFile(imageFile);
    _billLines.clear();
    dynamic results;
    results = await _recognizer.processImage(visionImage);
    print(results.text);
    for (final TextBlock block in results.blocks) {
      for (final TextLine line in block.lines) {
        _billLines.add(line.text.toString());
      }
    }
  }

  void addBillToList() {
    BillModel bill = BillModel(imageFile, "category", "amount", "tax", "moneyType", "corporation", "report", "date", "billNo");
    Provider.of<DetailsViewModel>(context!, listen: false).addList(bill);
    Provider.of<DetailsViewModel>(context!, listen: false).changeText();
  }

  void clearControllers() {
    category.text = "";
    amountController.text = "";

    taxController.text = "";

    corporationController.text = "";

    dateController.text = "";

    billNoController.text = "";
    cashTypeController.text = "";
  }

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    if (!isInitiated) {
      _recognizer = GoogleVision.instance.textRecognizer();
      isInitiated = !isInitiated;
    }
  }
}
