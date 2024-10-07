import 'package:doen/theme/Pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class WonderButtonIcon extends StatelessWidget {
  double height;
  Color background;
  Function onTap;
  double borderRadius;
  bool isSvgIcon;
  SvgPicture svgIcon;
  Icon icon;
  String label;

  WonderButtonIcon({
    Key key,
    this.height = 48.0,
    this.background = Pallete.primary,
    @required this.onTap,
    this.borderRadius = 12.0,
    this.isSvgIcon = true,
    this.svgIcon,
    this.icon,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(this.borderRadius),
        color: this.background,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 16.0,
            spreadRadius: -2.0,
            color: this.background.withOpacity(0.3),
          ),
        ],
      ),
      child: Material(
        color: Pallete.transparent,
        child: InkWell(
          splashColor: Pallete.white,
          borderRadius: BorderRadius.circular(this.borderRadius),
          onTap: this.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: this.isSvgIcon == false ? this.icon : this.svgIcon,
                ),
                Center(
                  child: Text(
                    this.label,
                    style: Pallete.button.copyWith(
                      color: Pallete.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WonderButton extends StatelessWidget {
  double height;
  Color background;
  Function onTap;
  double borderRadius;
  String label;

  WonderButton({
    Key key,
    this.height = 48.0,
    this.background = Pallete.primary,
    @required this.onTap,
    this.borderRadius = 12.0,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(this.borderRadius),
        color: this.background,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 16.0,
            spreadRadius: -2.0,
            color: this.background.withOpacity(0.3),
          ),
        ],
      ),
      child: Material(
        color: Pallete.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(this.borderRadius),
          splashColor: Pallete.white,
          onTap: this.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                this.label,
                style: Pallete.button.copyWith(
                  color: Pallete.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
