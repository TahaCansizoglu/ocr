import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:ocrdeneme/core/base/viewmodel/base_view_model.dart';
part 'more_viewmodel.g.dart';

class MoreViewModel = _MoreViewModelBase with _$MoreViewModel;

abstract class _MoreViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}
}
