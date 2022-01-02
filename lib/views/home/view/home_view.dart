import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, value) => const Scaffold(
              body: Center(
                child: Text("Home Page"),
              ),
            ));
  }
}
