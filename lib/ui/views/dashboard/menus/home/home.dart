import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:doen/theme/Pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                      "assets/images/backgrounds/background-four.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Hello \n",
                                style: GoogleFonts.nunitoSans(
                                  textStyle: TextStyle(
                                    color: Pallete.secondaryDark,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: "Sunima",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Pallete.primaryDark,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Badge(
                          position: BadgePosition(
                            bottom: 0.0,
                            left: 4.0,
                          ),
                          badgeColor: Pallete.red,
                          elevation: 0,
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              color: Pallete.grey,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.pexels.com/photos/3556533/pexels-photo-3556533.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Pallete.primary,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 24.0,
                          spreadRadius: -4.0,
                          color: Pallete.primary.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Finish your task by doing",
                                style: Pallete.cardTitle.copyWith(
                                  color: Pallete.white,
                                ),
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                "Amet minim mollit non deserunt ullamc`o est sit aliqua.",
                                style: Pallete.body.copyWith(
                                  color: Pallete.white,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              FlatButton(
                                onPressed: () {},
                                color: Pallete.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  "Start",
                                  style: TextStyle(
                                      color: Pallete.primary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Image.asset(
                          "assets/images/illustrations/card_illustration.png",
                          width: 100.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, top: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10.0,
                                      sigmaY: 10.0,
                                    ),
                                    child: Container(
                                      height: 100.0,
                                      padding: EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: Pallete.white.withOpacity(0.6),
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Text(
                                              "8",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  color: Pallete.primaryDark,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              "Finish",
                                              style: Pallete.body.copyWith(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 32.0,
                                  width: 32.0,
                                  decoration: BoxDecoration(
                                    color: Pallete.primary,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(-4, 4),
                                        blurRadius: 16.0,
                                        spreadRadius: -4,
                                        color: Pallete.primary,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      FeatherIcons.check,
                                      color: Pallete.white,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Flexible(
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, top: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10.0,
                                      sigmaY: 10.0,
                                    ),
                                    child: Container(
                                      height: 100.0,
                                      padding: EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: Pallete.white.withOpacity(0.6),
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Text(
                                              "12",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  color: Pallete.primaryDark,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              "Pending",
                                              style: Pallete.body.copyWith(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 32.0,
                                  width: 32.0,
                                  decoration: BoxDecoration(
                                    color: Pallete.orange,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(-4, 4),
                                        blurRadius: 16.0,
                                        spreadRadius: -4,
                                        color: Pallete.orange,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      FeatherIcons.crop,
                                      color: Pallete.white,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Flexible(
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, top: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10.0,
                                      sigmaY: 10.0,
                                    ),
                                    child: Container(
                                      height: 100.0,
                                      padding: EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: Pallete.white.withOpacity(0.6),
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Text(
                                              "2",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  color: Pallete.primaryDark,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              "Late",
                                              style: Pallete.body.copyWith(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 32.0,
                                  width: 32.0,
                                  decoration: BoxDecoration(
                                    color: Pallete.red,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(-4, 4),
                                        blurRadius: 16.0,
                                        spreadRadius: -4,
                                        color: Pallete.red,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      FeatherIcons.clipboard,
                                      color: Pallete.white,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          "Priority Task",
                          style: Pallete.title,
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            FeatherIcons.moreVertical,
                            size: 20.0,
                            color: Pallete.primaryDark,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 156.0,
                    child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkResponse(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Container(
                                width: 124.0,
                                color: Pallete.white.withOpacity(0.6),
                                padding: EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Badge(
                                          position: BadgePosition(
                                            top: -1.0,
                                            right: -1.0,
                                          ),
                                          elevation: 0,
                                          badgeColor: Pallete.lightBlue,
                                          child: Container(
                                            height: 32.0,
                                            width: 32.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              color: Pallete.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(0, 4),
                                                  spreadRadius: -4,
                                                  blurRadius: 16.0,
                                                  color: Color(0xFF8C8B8F)
                                                      .withOpacity(0.3),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                (index + 1).toString(),
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                    color: Pallete.primaryDark,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16.0,
                                        ),
                                        Text(
                                          "Amet minim mollit non deserunt ",
                                          style: Pallete.body.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Pallete.secondaryDark,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "08 : 59",
                                        style: Pallete.body.copyWith(
                                          color: Pallete.secondaryDark,
                                        ),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
