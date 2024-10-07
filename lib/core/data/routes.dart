import 'package:doen/core/data/all_key.dart';
import 'package:doen/ui/views/view.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const initialRoute = "/splash";

  static Map<String, WidgetBuilder> all() {
    return {
      RoutesKey.splash: (context) => Splash(),
      RoutesKey.dashboard: (context) => Dashboard(),
      RoutesKey.welcome: (context) => Welcome(),
      RoutesKey.signIn: (context) => SignIn(),
      RoutesKey.signUp: (context) => SignUp(),
      RoutesKey.forgotPassword: (context) => ForgotPassword(),
      RoutesKey.forgotPasswordFinish: (context) => ForgotPasswordFinish(),
      ...dashboardRoutes(),
    };
  }

  static Map<String, dynamic> dashboardRoutes() {
    return {
      RoutesKey.home: (context) => Home(),
      RoutesKey.plan: (context) => Plan(),
      RoutesKey.report: (context) => Report(),
      RoutesKey.setting: (context) => Setting(),
      RoutesKey.account: (context) => Account(),
      RoutesKey.editAccount: (context) => EditAccount(),

      // for specific routes
      ...planRoutes(),
    };
  }

  static Map<String, dynamic> planRoutes() {
    return {
      RoutesKey.addPlan: (context) => AddPlan(),
    };
  }
}
