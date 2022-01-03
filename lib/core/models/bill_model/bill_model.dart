// To parse this JSON data, do
//
//     final billModel = billModelFromJson(jsonString);

import 'dart:convert';

import 'dart:io';

List<BillModel> billModelFromJson(String str) =>
    List<BillModel>.from(json.decode(str).map((x) => BillModel.fromJson(x)));

String billModelToJson(List<BillModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BillModel {
  BillModel({
    this.id,
    required this.category,
    required this.amount,
    required this.tax,
    required this.moneyType,
    required this.corporation,
    required this.report,
    required this.date,
    required this.billNo,
  });
  int? id;
  String category;
  double amount;
  int tax;
  String moneyType;
  String corporation;
  String report;
  String date;
  int billNo;

  factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
        id: json['id'],
        category: json["category"],
        amount: json["amount"],
        tax: json["tax"],
        moneyType: json["moneyType"],
        corporation: json["corporation"],
        report: json["report"],
        date: json["date"],
        billNo: json["billNo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "amount": amount,
        "tax": tax,
        "moneyType": moneyType,
        "corporation": corporation,
        "report": report,
        "date": date,
        "billNo": billNo,
      };
}
