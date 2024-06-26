import 'package:flutter/material.dart';
import 'package:todo_app/src/core/constants/colors/color_constants.dart';
import 'package:todo_app/src/core/constants/textStyles/text_style_constants.dart';

import '../services/navigation/navigation_service.dart';

// Uygulama içerisinde kullanıcılara gösterdiğimiz uyarı mesajları
mixin ShowBar {
  void showErrorBar(
    dynamic message, {
    String? title,
    Duration? duration,
    Color? backgroundColor,
    TextStyle? style,
    BuildContext? context,
  }) {
    ScaffoldMessenger.of(
            context ?? NavigationService.instance.navigatorKey.currentContext!)
        .showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title == null ? const SizedBox() : Text(title),
            Text(
              message.toString(),
              style: style ??
                  TextStyleConstants.regularStyle(
                    color: ColorConstants.white,
                  ),
            ),
          ],
        ),
        duration: duration ?? const Duration(seconds: 2),
        backgroundColor: backgroundColor ?? ColorConstants.red,
      ),
    );
  }

  void showSuccessBar(
    dynamic message, {
    Duration? duration,
    String? title,
    Color? backgroundColor,
    TextStyle? style,
    BuildContext? context,
  }) {
    ScaffoldMessenger.of(
            context ?? NavigationService.instance.navigatorKey.currentContext!)
        .showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title == null ? const SizedBox() : Text(title),
            Text(
              message.toString(),
              style: style ??
                  TextStyleConstants.regularStyle(
                    color: ColorConstants.white,
                  ),
            ),
          ],
        ),
        duration: duration ?? const Duration(seconds: 2),
        backgroundColor: backgroundColor ?? ColorConstants.green,
      ),
    );
  }
}
