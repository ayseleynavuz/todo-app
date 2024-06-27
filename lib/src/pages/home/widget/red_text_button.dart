


import 'package:flutter/material.dart';
import 'package:todo_app/src/core/constants/colors/color_constants.dart';
import 'package:todo_app/src/core/constants/textStyles/text_style_constants.dart';

class RedTextButton extends StatelessWidget {
  const RedTextButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyleConstants.mediumStyle(
          color: ColorConstants.redtextColor,
        ),
      ),
    );
  }
}
