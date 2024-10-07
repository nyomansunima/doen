import 'package:doen/theme/Pallete.dart';
import 'package:doen/ui/components/component.dart';
import 'package:doen/ui/views/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController pageController;
  List<BottomNavItem> items = [
    BottomNavItem(
      label: "Home",
      icon: FeatherIcons.airplay,
    ),
    BottomNavItem(
      label: "Task",
      icon: FeatherIcons.calendar,
    ),
    BottomNavItem(
      label: "Report",
      icon: FeatherIcons.file,
    ),
    BottomNavItem(
      label: "Setting",
      icon: FeatherIcons.settings,
    ),
  ];

  _ontap(index) {
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Home(),
              Plan(),
              Report(),
              Setting(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigation(
              items: this.items,
              onTap: _ontap,
            ),
          ),
        ],
      ),
    );
  }
}
