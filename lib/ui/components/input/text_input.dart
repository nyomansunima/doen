import 'dart:ui';

import 'package:doen/core/validation/validation.dart';
import 'package:doen/theme/Pallete.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInput extends StatefulWidget {
  String validateKey;
  String hint;
  int maxLines;
  String value;
  TextInputAction textInputAction;
  Function onSaved;
  String label;
  String error;

  TextInput({
    Key key,
    @required this.validateKey,
    this.maxLines = 6,
    this.hint = "",
    this.value = "",
    @required this.textInputAction,
    @required this.onSaved,
    this.label = "",
    this.error,
  }) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool isValidate = true;
  bool isProtectedPass = false;
  bool isAutoValidate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Pallete.inputLabel,
        ),
        SizedBox(
          height: 8.0,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Container(
              width: double.infinity,
              child: TextFormField(
                autovalidate: this.isAutoValidate,
                initialValue: widget.value,
                style: Theme.of(context).textTheme.bodyText1,
                cursorWidth: 2.0,
                keyboardType: TextInputType.multiline,
                maxLines: widget.maxLines,
                textInputAction: widget.textInputAction,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).nextFocus();
                },
                validator: (value) {
                  String validation =
                      InputValidation.validate(value, widget.validateKey);
                  return validation;
                },
                onChanged: (value) {
                  if (value.length > 0) {
                    setState(() {
                      this.isAutoValidate = true;
                    });
                  }
                  String validation =
                      InputValidation.validate(value, widget.validateKey);
                  if (validation != null) {
                    setState(() {
                      this.isValidate = false;
                    });
                  } else {
                    setState(() {
                      this.isValidate = true;
                    });
                  }
                },
                onSaved: (value) {
                  widget.onSaved(value);
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  hintText: widget.hint,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Pallete.primary,
                      width: 2.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Pallete.red.withOpacity(0.5),
                      width: 2.0,
                    ),
                  ),
                  errorMaxLines: 1,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Pallete.red.withOpacity(0.5),
                      width: 2.0,
                    ),
                  ),
                  errorStyle: TextStyle(height: 1),
                  errorText: widget.error,
                  hintStyle:
                      Pallete.body.copyWith(color: Pallete.secondaryDark),
                  filled: true,
                  fillColor: isValidate
                      ? Pallete.white.withOpacity(0.6)
                      : Pallete.red.withOpacity(0.05),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
