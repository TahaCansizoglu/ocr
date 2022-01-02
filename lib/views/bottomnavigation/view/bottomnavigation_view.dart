import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';
import '../../_product/widgets/bottomnavigationbar/custom_bottom_navigation_bar.dart';
import '../../details/view/details_view.dart';
import '../../home/view/home_view.dart';
import '../../home/viewmodel/home_viewmodel.dart';
import '../viewmodel/bottomnavigation_viewmodel.dart';

class BottomnavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavigationViewModel>(
      viewModel: Provider.of<BottomNavigationViewModel>(context, listen: false),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, value) => Scaffold(
          body: Observer(builder: (_) {
            return Scaffold(body: destinator(value.selectedDestination.index));
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple,
            onPressed: () => value.addBill(),
            tooltip: 'Create',
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: FABBottomAppBar(
              items: [
                FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
                FABBottomAppBarItem(iconData: Icons.description_outlined, text: 'Details'),
                FABBottomAppBarItem(iconData: Icons.account_circle, text: 'Profile'),
                FABBottomAppBarItem(iconData: Icons.more_horiz, text: 'More'),
              ],
              centerItemText: "Add Bill",
              backgroundColor: Colors.white,
              color: Colors.grey,
              selectedColor: Colors.purple,
              notchedShape: CircularNotchedRectangle(),
              onTabSelected: value.selectDestination)),
    );
  }

  Widget destinator(int index) {
    switch (index) {
      case 0:
        return Consumer<HomeViewModel>(
          builder: (context, store, child) {
            return HomeView();
          },
        );
      case 1:
        return DetailsView();

      default:
        return Consumer<HomeViewModel>(
          builder: (context, store, child) {
            return HomeView();
          },
        );
    }
  }
}
