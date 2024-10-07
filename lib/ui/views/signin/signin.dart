import 'package:doen/core/data/all_key.dart';
import 'package:doen/core/viewmodels/user_account_view_model.dart';
import 'package:doen/theme/Pallete.dart';
import 'package:doen/ui/components/button/fancy_button.dart';
import 'package:doen/ui/components/component.dart';
import 'package:doen/ui/components/input/form_input.dart';
import 'package:doen/ui/views/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserAccountViewModel>(
      create: (context) => UserAccountViewModel(),
      builder: (context, child) {
        // get data from provider
        var userAccountViewModel = Provider.of<UserAccountViewModel>(context);

        if (userAccountViewModel == null) {
          return Container();
        } else {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/backgrounds/background-three.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
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
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Explore your journey",
                                  style: Pallete.title,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 72.0,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FormInput(
                                  label: "Email",
                                  textInputType: TextInputType.emailAddress,
                                  validateKey: ValidationKey.email,
                                  textInputAction: TextInputAction.next,
                                  error: userAccountViewModel.emailError,
                                  onSaved: (value) {
                                    this.email = value;
                                  },
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                FormInput(
                                  label: "Password",
                                  textInputType: TextInputType.visiblePassword,
                                  validateKey: ValidationKey.password,
                                  textInputAction: TextInputAction.done,
                                  error: userAccountViewModel.passwordEror,
                                  onSaved: (value) {
                                    this.password = value;
                                  },
                                ),
                                SizedBox(
                                  height: 36.0,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RoutesKey.forgotPassword);
                                    },
                                    child: Text("forget password"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 48.0,
                          ),
                          GlassButton(
                            ontap: () async {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                /** show loading when sign up */
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => LoadingProgress(
                                    label: "Please wait ...",
                                  ),
                                );
                                // run save method
                                await userAccountViewModel
                                    .signInWithEmailPassword(
                                  email,
                                  password,
                                );
                                // close loading popup
                                Navigator.of(context).pop();

                                if (userAccountViewModel.isSuccess) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Dashboard();
                                      },
                                    ),
                                  );
                                }
                              }
                            },
                            label: "Sign In",
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          WonderButtonIcon(
                            onTap: () async {
                              await userAccountViewModel.signInWithGoogle();

                              if (context
                                  .read<UserAccountViewModel>()
                                  .isSuccess) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Dashboard();
                                    },
                                  ),
                                );
                              }
                            },
                            svgIcon: SvgPicture.asset(
                                "assets/icons/google_logo_white.svg"),
                            label: "Sign In With Google",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
