import 'package:doen/ui/views/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  _next() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        Future.delayed(
          Duration(milliseconds: 1200),
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Welcome();
                },
              ),
            );
          },
        );
      } else {
        Future.delayed(
          Duration(milliseconds: 1200),
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Dashboard();
                },
              ),
            );
          },
        );
      }
    });
  }

  @override
  void initState() {
    _next();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/doen-app.png"),
                fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
