import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation_constant.dart';
import '../../../core/models/bill_model/bill_model.dart';

part 'details_viewmodel.g.dart';

class DetailsViewModel = _DetailsViewModelBase with _$DetailsViewModel;

abstract class _DetailsViewModelBase with Store, BaseViewModel {
  bool isInitialized = false;

  @observable
  String txt = "Deneme";

  @observable
  ObservableList<BillModel> list = ObservableList();

  @action
  void addList(BillModel item) {
    list.add(item);
    print(list);
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

  void fetchData() {}

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    if (!isInitialized) {
      print(list);
      for (var i = 0; i < 5; i++) {
        BillModel bill = BillModel(null, "category", "amount", "tax", "moneyType", "corporation", "report", "date", "billNo");
        list.add(bill);
      }
      isInitialized = !isInitialized;
    }
    print(list);
  }
}
