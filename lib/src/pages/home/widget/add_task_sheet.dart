import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/core/base/view/base_view.dart';
import 'package:todo_app/src/core/constants/textStyles/text_style_constants.dart';
import 'package:todo_app/src/core/extensions/bottom_sheet_extension.dart';
import 'package:todo_app/src/core/services/navigation/navigation_service.dart';
import 'package:todo_app/src/pages/home/viewModel/home_view_model.dart';
import 'package:todo_app/src/pages/home/widget/add_tag_sheet.dart';
import 'package:todo_app/src/pages/home/widget/custom_card.dart';
import 'package:todo_app/src/pages/home/widget/tag_card.dart';

class AddTaskSheet extends StatelessWidget {
  const AddTaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeViewModel>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        20.verticalSpace,
        TextField(
          controller: controller.titleController,
          decoration: InputDecoration(
            hintText: "Add a task",
            hintStyle: TextStyleConstants.mediumStyle(
              color: const Color(0xff88A7AA),
            ),
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          ),
        ),
        20.verticalSpace,
        Row(
          children: [
            10.horizontalSpace,
            CustomCard(
              onTap: () {
                controller.clearTag();
                context.showBottomSheet(const AddTagSheet());
              },
              title: " Add tag",
              leading: const Icon(
                Icons.add,
                color: Color(0xff3396A1),
              ),
            ),
            12.horizontalSpace,
            AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                crossFadeState: controller.currentTag != null
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: const SizedBox.shrink(),
                secondChild: controller.currentTag != null
                    ? TagCard(tag: controller.currentTag!)
                    : const SizedBox.shrink()),
            12.horizontalSpace,
            const CustomCard(
              title: " Add Date",
              leading: Icon(
                Icons.calendar_month,
                color: Color(0xff3396A1),
              ),
            ),
          ],
        ),
        20.verticalSpace,
        const Divider(),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RedTextButton(
              onPressed: () => NavigationService.instance.pop(),
              text: "Cancel",
            ),
            20.horizontalSpace,
            BlueButton(
              title: "Save",
              onTap: () {
                controller.addTodoModel(context);
              },
            ),
            20.horizontalSpace,
          ],
        ),
        20.verticalSpace,
      ],
    );
  }
}

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
      color: const Color(0xff3396A1),
      child: Text(
        title,
        style: TextStyleConstants.mediumStyle(color: Colors.white),
      ),
    );
  }
}

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
          color: const Color(0xffFF8A5B),
        ),
      ),
    );
  }
}
