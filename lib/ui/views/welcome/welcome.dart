import 'package:doen/core/models/models.dart';
import 'package:doen/core/service/intro_service.dart';
import 'package:doen/ui/components/component.dart';
import 'package:doen/ui/views/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  IntroService introService = IntroService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/backgrounds/background-one.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                FutureProvider<List<Intro>>(
                  create: (context) => introService.readAll(),
                  builder: (context, child) {
                    var listintro = Provider.of<List<Intro>>(context);

                    if (listintro == null) {
                      return Container(
                        height: 400.0,
                      );
                    } else {
                      return IntroSlider(
                        datas: listintro,
                        height: 400.0,
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 100.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GlassButton(
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignIn();
                                },
                              ),
                            );
                          },
                          label: "Sign In",
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        GlassButton(
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUp();
                                },
                              ),
                            );
                          },
                          label: "Sign Up",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
