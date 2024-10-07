import 'dart:ui';

import 'package:doen/core/data/all_key.dart';
import 'package:doen/theme/Pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: RoundCliper(),
            child: Container(
              height: 356.0,
              decoration: BoxDecoration(
                color: Pallete.primary,
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/backgrounds/background-waves.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 36.0,
                ),
                Text(
                  "Make confort you app now.",
                  style: Pallete.hugeTitle.copyWith(
                    color: Pallete.white,
                  ),
                ),
                SizedBox(height: 40.0),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Material(
                                color: Pallete.transparent,
                                child: InkWell(
                                  splashColor: Pallete.primary,
                                  onTap: () {},
                                  child: Container(
                                    height: 168.0,
                                    color: Pallete.white.withOpacity(0.6),
                                    padding: EdgeInsets.all(12.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 58.0,
                                            width: 58.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Pallete.primary,
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(0, 4),
                                                  spreadRadius: -4,
                                                  blurRadius: 24.0,
                                                  color: Pallete.primary
                                                      .withOpacity(0.3),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Icon(
                                                FeatherIcons.smartphone,
                                                color: Pallete.white,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Text(
                                            "App Setting",
                                            style: Pallete.body.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Material(
                                color: Pallete.transparent,
                                child: InkWell(
                                  splashColor: Pallete.purple,
                                  onTap: () {},
                                  child: Container(
                                    height: 168.0,
                                    color: Pallete.white.withOpacity(0.6),
                                    padding: EdgeInsets.all(12.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 58.0,
                                            width: 58.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Pallete.purple,
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(0, 4),
                                                  spreadRadius: -4,
                                                  blurRadius: 24.0,
                                                  color: Pallete.purple
                                                      .withOpacity(0.3),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Icon(
                                                FeatherIcons.bookmark,
                                                color: Pallete.white,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Text(
                                            "Membership Setting",
                                            style: Pallete.body.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 24.0,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 100.0,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Material(
                                color: Pallete.transparent,
                                child: InkWell(
                                  splashColor: Pallete.orange,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesKey.account);
                                  },
                                  child: Container(
                                    height: 168.0,
                                    color: Pallete.white.withOpacity(0.6),
                                    padding: EdgeInsets.all(12.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 58.0,
                                            width: 58.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Pallete.orange,
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(0, 4),
                                                  spreadRadius: -4,
                                                  blurRadius: 24.0,
                                                  color: Pallete.orange
                                                      .withOpacity(0.3),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Icon(
                                                FeatherIcons.user,
                                                color: Pallete.white,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Text(
                                            "Account Setting",
                                            style: Pallete.body.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Material(
                                color: Pallete.transparent,
                                child: InkWell(
                                  splashColor: Pallete.red,
                                  onTap: () {},
                                  child: Container(
                                    height: 168.0,
                                    color: Pallete.white.withOpacity(0.6),
                                    padding: EdgeInsets.all(12.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 58.0,
                                            width: 58.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Pallete.red,
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(0, 4),
                                                  spreadRadius: -4,
                                                  blurRadius: 24.0,
                                                  color: Pallete.red
                                                      .withOpacity(0.3),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Icon(
                                                FeatherIcons.book,
                                                color: Pallete.white,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24.0,
                                          ),
                                          Text(
                                            "Manual Apps",
                                            style: Pallete.body.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoundCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
