import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/constants/textStyles/text_style_constants.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
  });

  final String title;

  final void Function()? onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24.h,
        padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff111718).withOpacity(.04),
        ),
        child: Center(
            child: Row(
          children: [
            if (leading != null) leading!,
            Text(
              title,
              style: TextStyleConstants.regularStyle(
                color: const Color(0xff3396A1),
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        )),
      ),
    );
  }
}
