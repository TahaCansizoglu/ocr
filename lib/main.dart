import 'package:flutter/material.dart';
import 'package:ocrdeneme/core/init/database/database_service.dart';
import 'package:ocrdeneme/core/init/theme/purpletheme.dart';
import 'package:ocrdeneme/views/more/viewmodel/more_viewmodel.dart';
import 'package:ocrdeneme/views/profile/viewmodel/profile_viewmodel.dart';
import 'package:provider/provider.dart';

import 'core/init/database/database_service.dart';
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
        Provider<ProfileViewModel>(
          create: (_) => ProfileViewModel(),
        ),
        Provider<MoreViewModel>(
          create: (_) => MoreViewModel(),
        ),
      ],
      child: MaterialApp(
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
      ),
    );
  }
}
