import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
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
  String txt = "Deneme";

  @observable
  List<BillModel> list = [];
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
  void addList(BillModel item) {
    expensesList.add(item);
    amount += item.amount;
  }

  @action
  void changeText() {
    txt = "dasdasd";
  }

  @action
  void addBill() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      navigation.navigateToPage(path: NavigationConstants.ADD_BILL);
    });
  }

  Future<void> loadLocalJson() async {
    const String localJsonPath = 'assets/dummydata.json';
    var dummyData = await rootBundle.loadString(localJsonPath);
    List<dynamic> decodedJson = json.decode(dummyData);
    list = decodedJson.map((user) => BillModel.fromJson(user)).toList();
    expensesList.addAll(list.where((element) => element.amount < 0).toList());
    earningsList.addAll(list.where((element) => element.amount > 0).toList());
  }

  void fetchData() {}

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    if (!isInitialized) {
      // loadLocalJson();

      isInitialized = !isInitialized;
    }
  }
}
