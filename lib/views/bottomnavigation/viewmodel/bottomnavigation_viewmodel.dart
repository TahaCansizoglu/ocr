import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ocrdeneme/core/init/database/database_service.dart';
import 'package:ocrdeneme/core/models/bill_model/bill_model.dart';
import 'package:ocrdeneme/views/details/viewmodel/details_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:rect_getter/rect_getter.dart';

import '../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constants/enum/destination.dart';
import '../../../core/constants/navigation_constant.dart';

part 'bottomnavigation_viewmodel.g.dart';

class BottomNavigationViewModel = _BottomNavigationViewModelBase
    with _$BottomNavigationViewModel;

abstract class _BottomNavigationViewModelBase with Store, BaseViewModel {
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
  Future<void> fecthData() async {
    List<BillModel> tmp = await DatabaseService.instance.getBills();
    Provider.of<DetailsViewModel>(context!, listen: false).addListAll(tmp);
  }

  Future<void> init() async {
    await fecthData();
  }

  void getBillPage() {
    navigation.navigateToPage(path: NavigationConstants.ADD_BILL);
  }
}
