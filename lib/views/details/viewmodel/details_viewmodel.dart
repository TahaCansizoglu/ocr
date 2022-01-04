import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constants/navigation_constant.dart';
import '../../../core/models/bill_model/bill_model.dart';

part 'details_viewmodel.g.dart';

class DetailsViewModel = _DetailsViewModelBase with _$DetailsViewModel;

abstract class _DetailsViewModelBase with Store, BaseViewModel {
  bool isInitialized = false;
  @observable
  double amount = 9800.00;
  @observable
  bool isOnClick = true;

  @observable
  bool isButtonTextExpenses = true;

  @observable
  ObservableList<BillModel> list = ObservableList();
  @observable
  ObservableList<BillModel> expensesList = ObservableList();
  @observable
  ObservableList<BillModel> earningsList = ObservableList();

  @action
  void changeListFilter(String type) {
    if (type == "Expenses") {
      isButtonTextExpenses = true;
      isOnClick = true;
    } else {
      isButtonTextExpenses = false;
      isOnClick = false;
    }
  }

  @action
  void sortList(String type) {
    if (type == "Low Price") {
      isButtonTextExpenses
          ? expensesList.sort((a, b) => b.amount.compareTo(a.amount))
          : earningsList.sort((a, b) => a.amount.compareTo(b.amount));
    } else if (type == "High Price") {
      isButtonTextExpenses
          ? expensesList.sort((a, b) => a.amount.compareTo(b.amount))
          : earningsList.sort((a, b) => b.amount.compareTo(a.amount));
    } else {}
  }

  @action
  void addList(BillModel item) {
    list.add(item);
    amount += item.amount;
    parseList();
  }

  void addListAll(List<BillModel> items) {
    list.clear();
    list.addAll(items);
    parseList();
  }

  Future<void> parseList() async {
    // const String localJsonPath = 'assets/dummydata.json';
    // var dummyData = await rootBundle.loadString(localJsonPath);
    // List<dynamic> decodedJson = json.decode(dummyData);
    // list = decodedJson.map((user) => BillModel.fromJson(user)).toList();
    expensesList.clear();
    earningsList.clear();
    expensesList.addAll(list.where((element) => element.amount < 0).toList());
    earningsList.addAll(list.where((element) => element.amount > 0).toList());
  }

  void fetchData() {}

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    if (!isInitialized) {
      //loadLocalJson();

      isInitialized = !isInitialized;
    }
  }
}
