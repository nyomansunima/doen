import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:doen/core/data/all_key.dart';
import 'package:doen/theme/Pallete.dart';
import 'package:doen/ui/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Plan extends StatefulWidget {
  @override
  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/images/backgrounds/background-four.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 52.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Text(
                      "Seeing your favorit plan",
                      style: Pallete.title,
                    ),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      WonderButton(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesKey.addPlan);
                        },
                        label: "Add Plan",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Pallete.white,
                        ),
                        child: Center(
                          child: Text(
                            "8",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 15.0,
                                color: Pallete.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        "Today",
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
                SizedBox(
                  height: 32.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Pallete.white,
                        ),
                        child: Center(
                          child: Text(
                            "8",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 15.0,
                                color: Pallete.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        "Tomorrow",
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
                SizedBox(
                  height: 32.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Pallete.white,
                        ),
                        child: Center(
                          child: Text(
                            "8",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 15.0,
                                color: Pallete.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        "Some Day",
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
                SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
