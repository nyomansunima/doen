import 'dart:ui';

import 'package:doen/theme/Pallete.dart';
import 'package:flutter/material.dart';

/// Glass effect button component
///
///

// ignore: must_be_immutable
class GlassButton extends StatelessWidget {
  double height;
  Function ontap;
  double borderRadius;
  String label;

  GlassButton({
    Key key,
    @required this.ontap,
    this.height = 48,
    this.borderRadius = 12.0,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: Material(
            color: Pallete.transparent,
            child: InkWell(
              splashColor: Pallete.primary,
              onTap: ontap,
              child: Container(
                height: height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Pallete.white.withOpacity(.6),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: Pallete.button,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
