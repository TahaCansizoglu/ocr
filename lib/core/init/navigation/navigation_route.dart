import 'package:flutter/material.dart';
import 'package:ocrdeneme/views/details/view/details_view.dart';
import 'package:ocrdeneme/views/more/view/more_view.dart';
import 'package:ocrdeneme/views/profile/view/profile_view.dart';
import '../../constants/navigation_constant.dart';
import '../../../views/add_bill/view/add_bill_view.dart';
import '../../../views/bottomnavigation/view/bottomnavigation_view.dart';
import '../../../views/home/view/home_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(
            BottomnavigationView(), NavigationConstants.DEFAULT);

      case NavigationConstants.HOME:
        return normalNavigate(HomeView(), NavigationConstants.HOME);
      case NavigationConstants.ADD_BILL:
        return normalNavigate(AddBillView(), NavigationConstants.ADD_BILL);
      case NavigationConstants.DETAILS:
        return normalNavigate(DetailsView(), NavigationConstants.DETAILS);
      case NavigationConstants.PROFILE:
        return normalNavigate(ProfileView(), NavigationConstants.PROFILE);
      case NavigationConstants.MORE:
        return normalNavigate(MoreView(), NavigationConstants.MORE);

      default:
        return MaterialPageRoute(
          builder: (context) => Text("Yok"),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }
}
