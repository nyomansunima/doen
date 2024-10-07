import 'dart:ui';

import 'package:doen/core/data/routes.dart';
import 'package:doen/core/models/user_account.dart';
import 'package:doen/core/service/user_account_service.dart';
import 'package:doen/core/viewmodels/user_account_view_model.dart';
import 'package:doen/theme/Pallete.dart';
import 'package:doen/ui/components/component.dart';
import 'package:doen/ui/views/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
              child: FutureProvider<String>(
                create: (context) => UserAccountService().getUserIdLocal(),
                builder: (context, child) {
                  String userId = Provider.of<String>(context);

                  // checking if the user id not null
                  return userId == null
                      ? Container()
                      : StreamProvider<UserAccount>(
                          create: (_) =>
                              UserAccountViewModel().streamUser(userId),
                          builder: (context, child) {
                            UserAccount userAccount =
                                Provider.of<UserAccount>(context);
                            if (userAccount == null) {
                              return Container();
                            } else {
                              return Column(
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
                                          "Account",
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
                                      Padding(
                                        padding: EdgeInsets.only(top: 56.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 10.0,
                                              sigmaY: 10.0,
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.all(12.0),
                                              height: 160.0,
                                              color: Pallete.white
                                                  .withOpacity(0.6),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Spacer(),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 8.0,
                                                                vertical: 4.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          color:
                                                              Pallete.primary,
                                                        ),
                                                        child: Text(
                                                          "Platinum",
                                                          style: GoogleFonts
                                                              .nunitoSans(
                                                            color:
                                                                Pallete.white,
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 12.0,
                                                  ),
                                                  Text(
                                                    userAccount.getFullName,
                                                    style: Pallete.cardTitle,
                                                  ),
                                                  SizedBox(
                                                    height: 20.0,
                                                  ),
                                                  Text(
                                                    userAccount.getBio == ""
                                                        ? "-"
                                                        : userAccount.getBio,
                                                    style: Pallete.body,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          height: 80.0,
                                          width: 80.0,
                                          padding: EdgeInsets.all(4.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Pallete.white,
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 4),
                                                blurRadius: 24.0,
                                                spreadRadius: -4.0,
                                                color: Color(0xFF8C8B8F)
                                                    .withOpacity(0.3),
                                              ),
                                            ],
                                          ),
                                          child: Hero(
                                            tag: "photo_profile",
                                            child: CircleAvatar(
                                              backgroundImage: userAccount
                                                              .getPhotoUrl ==
                                                          "" ||
                                                      userAccount.getPhotoUrl ==
                                                          null
                                                  ? AssetImage(
                                                      "assets/images/illustrations/avatar_illustration.png")
                                                  : NetworkImage(
                                                      userAccount.getPhotoUrl),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 36.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: WonderButton(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditAccount(
                                                  userId: userId,
                                                ),
                                              ),
                                            );
                                          },
                                          height: 44.0,
                                          label: "Edit Profile",
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Flexible(
                                        child: WonderButton(
                                          background: Pallete.lightBlue,
                                          onTap: () async {
                                            await UserAccountViewModel()
                                                .signOut();

                                            // move view
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                              Routes.initialRoute,
                                              ModalRoute.withName('/'),
                                            );
                                          },
                                          height: 44.0,
                                          label: "Sign Out",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }
                          },
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
