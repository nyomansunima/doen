import 'package:doen/core/data/all_key.dart';
import 'package:doen/core/viewmodels/user_account_view_model.dart';
import 'package:doen/theme/Pallete.dart';
import 'package:doen/ui/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:lottie/lottie.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/images/backgrounds/background-two.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 56.0, 20.0, 20.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          BackButtonGlass(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              FeatherIcons.chevronLeft,
                              size: 20,
                              color: Pallete.primaryDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    "Forgot your password ?",
                    style: Pallete.title,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Please enter your email below to receive the reset password instruction",
                    style: Pallete.body,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  LottieBuilder.asset(
                    'assets/lottie/send_email.json',
                    height: 240.0,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FormInput(
                          label: "Your email",
                          textInputType: TextInputType.emailAddress,
                          validateKey: ValidationKey.email,
                          textInputAction: TextInputAction.done,
                          onSaved: (value) {
                            this.email = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  WonderButton(
                    onTap: () {
                      // validate first
                      if (_formKey.currentState.validate()) {
                        // store all value from theese form
                        _formKey.currentState.save();

                        // showing loading
                        showDialog(
                          context: context,
                          builder: (context) => LoadingProgress(
                            label: "Please wait ...",
                          ),
                        );
                        // run method reset password
                        UserAccountViewModel()
                            .forgotPassword(email)
                            .then((value) {
                          // close dialog loading and going to finish
                          Navigator.popAndPushNamed(
                              context, RoutesKey.forgotPasswordFinish);
                        });
                      }
                    },
                    label: "Send",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForgotPasswordFinish extends StatefulWidget {
  @override
  _ForgotPasswordFinishState createState() => _ForgotPasswordFinishState();
}

class _ForgotPasswordFinishState extends State<ForgotPasswordFinish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/images/backgrounds/background-two.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 56.0, 20.0, 20.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          BackButtonGlass(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              FeatherIcons.chevronLeft,
                              size: 20,
                              color: Pallete.primaryDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    "Check your email",
                    style: Pallete.title,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Please check your email and follow reset password link.",
                    style: Pallete.body,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  LottieBuilder.asset(
                    'assets/lottie/email_sended.json',
                    height: 240.0,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  WonderButton(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    label: "Finish",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
