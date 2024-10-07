import 'dart:ui';

import 'package:doen/theme/Pallete.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackButtonGlass extends StatelessWidget {
  double height;
  double width;
  double borderRadius;
  Function onTap;
  Icon icon;

  BackButtonGlass({
    Key key,
    @required this.onTap,
    @required this.icon,
    this.height = 32.0,
    this.width = 32.0,
    this.borderRadius = 8.0,
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
            onTap: onTap,
            child: Container(
              height: this.height,
              width: this.width,
              decoration: BoxDecoration(
                color: Pallete.white.withOpacity(.6),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Center(
                child: this.icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
