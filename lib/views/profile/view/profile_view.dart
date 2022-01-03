import 'package:flutter/material.dart';
import 'package:ocrdeneme/core/base/view/base_view.dart';
import 'package:ocrdeneme/views/profile/viewmodel/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: Provider.of<ProfileViewModel>(context, listen: false),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ProfileViewModel value) => Scaffold(
          body: Center(
        child: Text("Profile Screen"),
      )),
    );
  }
}
