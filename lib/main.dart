import 'package:doen/core/data/routes.dart';
import 'package:doen/theme/Pallete.dart';
import 'package:doen/theme/style.dart';
import 'package:doen/theme/system_setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DoenApp());
}

// ignore: must_be_immutable
class DoenApp extends StatelessWidget {
  User user;

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => Firebase.initializeApp(),
      builder: (context, child) {
        // get data from provider
        var app = Provider.of<FirebaseApp>(context);

        /** run system settings  */
        SystemSetting.changeStatusBar();

        if (app == null) {
          return Container(
            decoration: BoxDecoration(
              color: Pallete.background,
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return MaterialApp(
            title: 'Doen',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: Style.themeData(context),
            initialRoute: Routes.initialRoute,
            routes: Routes.all(),
          );
        }
      },
    );
  }
}
