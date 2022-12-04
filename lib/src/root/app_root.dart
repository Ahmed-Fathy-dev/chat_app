import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/Routers/route_name.dart';
import '../core/Routers/router.dart';
import '../core/Theme/app_theming.dart';
import '../providers.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child:const AppRootView(),
    );
  }
}

class AppRootView extends StatelessWidget {
  const AppRootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      themeMode: ThemeMode.light,
      darkTheme: AppThemeData.darkThemeData,
      initialRoute: '/${RouteName.chatsPage}',
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
