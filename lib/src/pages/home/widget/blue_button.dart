import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/constants/colors/color_constants.dart';
import 'package:todo_app/src/core/constants/textStyles/text_style_constants.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      color: ColorConstants.primaryColor,
      child: Text(
        title,
        style: TextStyleConstants.mediumStyle(color: Colors.white),
      ),
    );
  }
}
