import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension BottomSheetExtension on BuildContext {
  void showBottomSheet(Widget child) {
    showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      builder: (context) => child,
    );
  }
}
