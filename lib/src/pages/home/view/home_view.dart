import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/core/constants/app/app_constants.dart';
import 'package:todo_app/src/core/constants/colors/color_constants.dart';
import 'package:todo_app/src/core/constants/textStyles/text_style_constants.dart';
import 'package:todo_app/src/core/extensions/bottom_sheet_extension.dart';
import 'package:todo_app/src/core/services/navigation/navigation_service.dart';
import 'package:todo_app/src/pages/home/view/today_view.dart';
import 'package:todo_app/src/pages/home/widget/add_task_sheet.dart';

import '../viewModel/home_view_model.dart';

part '../widget/home_appbar.dart';
part '../widget/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: const HomeBody(),
        floatingActionButton: floatActionButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget floatActionButton(BuildContext context) {
    return SizedBox(
      width: 64.h,
      height: 64.h,
      child: FloatingActionButton(
        backgroundColor: ColorConstants.primaryColor,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 28.sp,
        ),
        onPressed: () {
          context.showBottomSheet(const AddTaskSheet());
        },
      ),
    );
  }
}
