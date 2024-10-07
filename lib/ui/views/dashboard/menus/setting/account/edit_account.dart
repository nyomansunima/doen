import 'dart:ui';

import 'package:doen/core/data/all_key.dart';
import 'package:doen/core/models/models.dart';
import 'package:doen/core/service/services.dart';
import 'package:doen/core/viewmodels/viewmodels.dart';
import 'package:doen/theme/Pallete.dart';
import 'package:doen/ui/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditAccount extends StatefulWidget {
  String userId;
  EditAccount({
    Key key,
    this.userId,
  }) : super(key: key);

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final userAccountService = UserAccountService();
  final _formKey = GlobalKey<FormState>();
  UserAccount newUserAccount = UserAccount();

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
              child: MultiProvider(
                providers: [
                  StreamProvider<UserAccount>(
                    create: (context) =>
                        UserAccountViewModel().streamUser(widget.userId),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => UserAccountViewModel(),
                  ),
                ],
                builder: (context, child) {
                  // get provider value
                  var userAccount = Provider.of<UserAccount>(context);
                  var userAccountViewModel =
                      Provider.of<UserAccountViewModel>(context);
                  return userAccount == null
                      ? Container()
                      : Column(
                          children: [
                            //==== back button and title
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
                                    "Edit Profile",
                                    style: Pallete.title,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.0,
                            ),

                            Stack(
                              children: [
                                Container(
                                  height: 100.0,
                                  width: 100.0,
                                  padding: EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Pallete.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 24.0,
                                        spreadRadius: -4.0,
                                        color:
                                            Color(0xFF8C8B8F).withOpacity(0.3),
                                      ),
                                    ],
                                  ),
                                  child: Hero(
                                    tag: "photo_profile",
                                    child: CircleAvatar(
                                      backgroundImage: userAccountViewModel
                                                  .imageProfile ==
                                              null
                                          ? userAccount.getPhotoUrl == "" ||
                                                  userAccount.getPhotoUrl ==
                                                      null
                                              ? AssetImage(
                                                  "assets/images/illustrations/avatar_illustration.png")
                                              : NetworkImage(
                                                  userAccount.getPhotoUrl)
                                          : FileImage(userAccountViewModel
                                              .imageProfile),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    height: 36.0,
                                    width: 36.0,
                                    decoration: BoxDecoration(
                                      color: Pallete.primary,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 4),
                                          blurRadius: 16.0,
                                          spreadRadius: -4.0,
                                          color:
                                              Pallete.primary.withOpacity(.3),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          FeatherIcons.camera,
                                          size: 18.0,
                                          color: Pallete.white,
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) {
                                              return BottomSheetModal(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "Select your Profile",
                                                      style: Pallete.cardTitle,
                                                    ),
                                                    SizedBox(
                                                      height: 64.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          child:
                                                              WonderButtonIcon(
                                                            onTap: () {
                                                              userAccountViewModel
                                                                  .pickImage(
                                                                      ImageSource
                                                                          .camera);

                                                              // close popup
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            svgIcon: null,
                                                            label: "Camera",
                                                            isSvgIcon: false,
                                                            icon: Icon(
                                                              FeatherIcons
                                                                  .camera,
                                                              color:
                                                                  Pallete.white,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 20.0,
                                                        ),
                                                        Flexible(
                                                          child:
                                                              WonderButtonIcon(
                                                            onTap: () {
                                                              userAccountViewModel
                                                                  .pickImage(
                                                                      ImageSource
                                                                          .gallery);
                                                              // close popup
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            svgIcon: null,
                                                            background: Pallete
                                                                .lightBlue,
                                                            label: "Galery",
                                                            isSvgIcon: false,
                                                            icon: Icon(
                                                              FeatherIcons
                                                                  .image,
                                                              color:
                                                                  Pallete.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 32.0,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FormInput(
                                    label: "Full Name",
                                    value: userAccount.getFullName,
                                    textInputType: TextInputType.name,
                                    validateKey: ValidationKey.name,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) {
                                      newUserAccount.setFullName = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  FormInput(
                                    label: "Email",
                                    value: userAccount.getEmail,
                                    textInputType: TextInputType.name,
                                    validateKey: ValidationKey.name,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) {
                                      newUserAccount.setEmail = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  FormInput(
                                    label: "Username",
                                    value: userAccount.getUsername,
                                    textInputType: TextInputType.name,
                                    validateKey: ValidationKey.name,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) {
                                      newUserAccount.setUsername = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  FormInput(
                                    label: "Password",
                                    value: userAccount.getPassword,
                                    textInputType: TextInputType.name,
                                    validateKey: ValidationKey.name,
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) {
                                      newUserAccount.setPassword = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  TextInput(
                                    label: "Bio",
                                    validateKey: "",
                                    value: userAccount.getBio,
                                    textInputAction: TextInputAction.done,
                                    onSaved: (value) {
                                      newUserAccount.setBio = value;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: WonderButton(
                                    onTap: () async {
                                      // validate the form
                                      if (_formKey.currentState.validate()) {
                                        // show loading update
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) => LoadingProgress(
                                            label: "Uploading",
                                          ),
                                        );
                                        // store the data
                                        _formKey.currentState.save();
                                        // update profile now

                                        await userAccountViewModel
                                            .updateProfile(
                                          userAccount,
                                          newUserAccount,
                                          widget.userId,
                                        );
                                        // waiting until complete
                                        Navigator.of(context).pop();
                                      }
                                    },
                                    height: 44.0,
                                    label: "Save",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
