import 'dart:io';

class BillModel {
  String? category;
  String? amount;
  String? tax;
  String? moneyType;
  String? corporation;
  String? report;
  String? date;
  String? billNo;
  File? imageFile;

  BillModel(
    this.imageFile,
    this.category,
    this.amount,
    this.tax,
    this.moneyType,
    this.corporation,
    this.report,
    this.date,
    this.billNo,
  );
}
