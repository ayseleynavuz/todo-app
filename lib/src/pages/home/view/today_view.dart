import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/core/constants/colors/color_constants.dart';
import 'package:todo_app/src/core/constants/textStyles/text_style_constants.dart';
import 'package:todo_app/src/core/mixins/show_bar.dart';
import 'package:todo_app/src/pages/home/model/todo_model.dart';
import 'package:todo_app/src/pages/home/viewModel/home_view_model.dart';
import 'package:todo_app/src/pages/home/widget/add_task_sheet.dart';
import 'package:todo_app/src/pages/home/widget/blue_button.dart';
import 'package:todo_app/src/pages/home/widget/red_text_button.dart';

class TodayView extends StatelessWidget with ShowBar {
  const TodayView({
    super.key,
    required this.todos,
  });

  final List<TodoModel> todos;

  @override
  Widget build(BuildContext context) {
    final HomeViewModel controller = context.watch<HomeViewModel>();
    return SizedBox(
      child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            TodoModel todo = todos[index];
            return Dismissible(
              key: Key(todo.id),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  return await showDialog(
                    context: context,
                    builder: (context) {
                      return deleteDialog(context, todo);
                    },
                  );
                }
                return false;
              },
              direction: DismissDirection.endToStart,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    20.horizontalSpace,
                    InkWell(
                      onTap: () {
                        todo = todo.copyWith(
                            isCompleted: !todo.isCompleted,
                            progress: todo.isCompleted ? 0 : 1);
                        controller.updateTask(todo);
                      },
                      child: Icon(
                        todo.isCompleted
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: ColorConstants.lightBlueGrey,
                        size: 24.sp,
                      ),
                    ),
                    8.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todo.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleConstants.mediumStyle(
                            decoration: todo.isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        4.verticalSpace,
                        Row(
                          children: [
                            Container(
                              height: 24.h,
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.5.h, horizontal: 8.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstants.appbarBackgroundColor,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    if (todo.tag != null)
                                      Text(todo.tag!.name,
                                          style:
                                              TextStyleConstants.regularStyle(
                                                  color: ColorConstants
                                                      .primaryColor)),
                                  ],
                                ),
                              ),
                            ),
                            10.horizontalSpace,
                            SizedBox(
                              width: 20.r,
                              height: 20.r,
                              child: CircularProgressIndicator(
                                value: todo.progress,
                                strokeWidth: 4,
                                backgroundColor: ColorConstants.lightBlueGrey,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  ColorConstants.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  AlertDialog deleteDialog(BuildContext context, TodoModel todo) {
    return AlertDialog(
      content: Text(
        "Do you want to delete your to-do permanently?",
        style: TextStyleConstants.mediumStyle(fontSize: 19.sp),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        RedTextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            todos.remove(todo);
            context.read<HomeViewModel>().removeTask(todo);
            showSuccessBar(
              "Task deleted successfully",
            );
          },
          text: 'Delete',
        ),
        BlueButton(
          onTap: () {
            Navigator.of(context).pop(false);
          },
          title: 'Cancel',
        ),
      ],
    );
  }
}
