import 'package:flutter/material.dart';
import 'package:ocrdeneme/core/base/view/base_view.dart';
import 'package:ocrdeneme/views/more/viewmodel/more_viewmodel.dart';
import 'package:provider/provider.dart';

class MoreView extends StatelessWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MoreViewModel>(
      viewModel: Provider.of<MoreViewModel>(context, listen: false),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, MoreViewModel value) =>
          Scaffold(body: Center(child: Text("More Screen"))),
    );
  }
}
