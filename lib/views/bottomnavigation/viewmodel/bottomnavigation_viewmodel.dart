import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/enum/destination.dart';
import '../../../core/constants/navigation_constant.dart';

part 'bottomnavigation_viewmodel.g.dart';

class BottomNavigationViewModel = _BottomNavigationViewModelBase with _$BottomNavigationViewModel;

abstract class _BottomNavigationViewModelBase with Store, BaseViewModel {
  @observable
  int number = 0;
  static const List<Destination> destinations = Destination.values;

  @observable
  int selectedDestinationIndex = destinations.indexOf(Destination.Home);

  @computed
  Destination get selectedDestination => destinations[selectedDestinationIndex];

  @action
  void selectDestination(int index) {
    selectedDestinationIndex = index;
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  void init() {
    //  for (var i = 0; i < 5; i++) {
    //   BillModel bill = BillModel(null, "category", "amount", "tax", "moneyType", "corporation", "report", "date", "billNo");
    //   Provider.of<DetailsViewModel>(context!).addList(bill);
    // }
  }

  void addBill() {
    navigation.navigateToPage(path: NavigationConstants.ADD_BILL);
  }
}
