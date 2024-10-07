import 'package:doen/core/data/all_key.dart';
import 'package:doen/theme/Pallete.dart';
import 'package:doen/ui/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class AddPlan extends StatefulWidget {
  @override
  _AddPlanState createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
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
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Container(
              height: 56.0,
              decoration: BoxDecoration(
                color: Pallete.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
