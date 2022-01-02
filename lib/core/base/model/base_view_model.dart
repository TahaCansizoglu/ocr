import 'package:flutter/material.dart';
import 'package:ocrdeneme/core/models/bill_model/bill_model.dart';
import '../../init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  BuildContext? context;

  NavigationService navigation = NavigationService.instance;
  void setContext(BuildContext context);
  void init();
}
