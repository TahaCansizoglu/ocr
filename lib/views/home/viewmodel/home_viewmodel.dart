import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rect_getter/rect_getter.dart';
import '../../../core/base/viewmodel/base_view_model.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
}
