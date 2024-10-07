import 'package:doen/theme/Pallete.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  double height;
  List<BottomNavItem> items;
  ValueChanged<int> onTap;

  BottomNavigation({
    Key key,
    @required this.items,
    @required this.onTap,
  }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Pallete.primary,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 24.0,
            spreadRadius: -4.0,
            color: Pallete.primary.withOpacity(0.3),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.items
              .asMap()
              .map((index, element) => MapEntry(
                    index,
                    selected == index
                        ? ActiveButton(
                            icon: element.icon,
                            onTap: () {
                              widget.onTap(index);
                            },
                            label: element.label,
                          )
                        : InActiveButton(
                            icon: element.icon,
                            onTap: () {
                              setState(() {
                                selected = index;
                                widget.onTap(index);
                              });
                            },
                          ),
                  ))
              .values
              .toList(),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ActiveButton extends StatelessWidget {
  IconData icon;
  Function onTap;
  String label;

  ActiveButton({
    Key key,
    @required this.icon,
    @required this.onTap,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Pallete.white.withOpacity(0.19),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              this.icon,
              size: 18.0,
              color: Pallete.white,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              this.label,
              style: Pallete.body.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class InActiveButton extends StatelessWidget {
  IconData icon;
  Function onTap;

  InActiveButton({
    Key key,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        this.icon,
        size: 18.0,
        color: Pallete.white.withOpacity(0.8),
      ),
      onPressed: this.onTap,
    );
  }
}

class BottomNavItem extends ChangeNotifier {
  String label;
  IconData icon;

  BottomNavItem({
    @required this.label,
    @required this.icon,
  });
}
