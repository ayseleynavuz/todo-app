import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/constants/colors/color_constants.dart';
import 'package:todo_app/src/core/constants/textStyles/text_style_constants.dart';
import 'package:todo_app/src/pages/home/model/tag_model.dart';

class TagCard extends StatelessWidget {
  const TagCard({super.key, required this.tag, this.onTap});
  final TagModel tag;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minWidth: 70.w,
        ),
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: Color(tag.color),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            tag.name,
            style: TextStyleConstants.mediumStyle(
              color: ColorConstants.white,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
