import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ocrdeneme/core/base/model/base_view_model.dart';
part 'profile_viewmodel.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}
}
