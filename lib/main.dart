import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'views/add_bill/viewmodel/add_bill_view_model.dart';
import 'views/bottomnavigation/viewmodel/bottomnavigation_viewmodel.dart';
import 'views/details/viewmodel/details_viewmodel.dart';
import 'views/home/viewmodel/home_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BottomNavigationViewModel>(
          create: (_) => BottomNavigationViewModel(),
        ),
        Provider<HomeViewModel>(
          create: (_) => HomeViewModel(),
        ),
        Provider<DetailsViewModel>(
          create: (_) => DetailsViewModel(),
        ),
        Provider<AddBillViewModel>(
          create: (_) => AddBillViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
      ),
    );
  }
}
