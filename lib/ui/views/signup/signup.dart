import 'package:doen/core/data/all_key.dart';
import 'package:doen/core/viewmodels/user_account_view_model.dart';
import 'package:doen/theme/Pallete.dart';
import 'package:doen/ui/components/component.dart';
import 'package:doen/ui/views/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String fullName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserAccountViewModel>(
      create: (context) => UserAccountViewModel(),
      builder: (context, child) {
        // get provider data
        var userAccountViewModel = Provider.of<UserAccountViewModel>(context);

        return userAccountViewModel == null
            ? Container()
            : Scaffold(
                body: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/backgrounds/background-two.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 56.0, 20.0, 20.0),
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
                                    "Start your journey",
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
                                    label: "Full Name",
                                    textInputType: TextInputType.name,
                                    validateKey: ValidationKey.name,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) {
                                      this.fullName = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
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
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    validateKey: ValidationKey.password,
                                    textInputAction: TextInputAction.done,
                                    error: userAccountViewModel.passwordEror,
                                    onSaved: (value) {
                                      this.password = value;
                                    },
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
                                  await userAccountViewModel
                                      .signUpWithEmailPassword(
                                          email, password, fullName);
                                  // close loading
                                  Navigator.of(context).pop();

                                  if (userAccountViewModel.isSuccess) {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      RoutesKey.dashboard,
                                      ModalRoute.withName('/'),
                                    );
                                  }
                                }
                              },
                              label: "Sign Up",
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            WonderButtonIcon(
                              onTap: () async {
                                // store data to firebase
                                await userAccountViewModel.signUpWithGoogle();

                                if (userAccountViewModel.isSuccess) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    RoutesKey.dashboard,
                                    ModalRoute.withName('/'),
                                  );
                                }
                              },
                              svgIcon: SvgPicture.asset(
                                  "assets/icons/google_logo_white.svg"),
                              label: "Sign Un With Google",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
