import 'package:doen/theme/Pallete.dart';
import 'package:flutter/material.dart';

class LoadingProgress extends StatelessWidget {
  String label;

  LoadingProgress({
    Key key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Center(
          child: Container(
            height: 160.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Pallete.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            margin: EdgeInsets.all(32.0),
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                this.label == null
                    ? SizedBox()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 24.0,
                          ),
                          Text(
                            this.label,
                            style: Pallete.button
                                .copyWith(color: Pallete.primaryDark),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
