import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/core/constants/colors/color_constants.dart';
import 'package:todo_app/src/core/constants/textStyles/text_style_constants.dart';
import 'package:todo_app/src/core/extensions/widget_extensions.dart';
import 'package:todo_app/src/core/services/navigation/navigation_service.dart';
import 'package:todo_app/src/pages/home/model/tag_model.dart';
import 'package:todo_app/src/pages/home/viewModel/home_view_model.dart';
import 'package:todo_app/src/pages/home/widget/tag_card.dart';

class AddTagSheet extends StatelessWidget {
  const AddTagSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel controller = context.watch<HomeViewModel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          10.verticalSpace,
          const Divider(
            thickness: 1,
            color: ColorConstants.lightGrey,
          ),
          20.verticalSpace,
          Row(
            children: [
              Text(
                "Tags",
                style: TextStyleConstants.mediumStyle(
                    color: ColorConstants.primaryColor),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  NavigationService.instance.pop();
                },
                child: const Icon(
                  Icons.close,
                  color: ColorConstants.primaryColor,
                ),
              ),
            ],
          ),
          20.verticalSpace,
          TextField(
            controller: controller.tagController,
            onChanged: (value) {
              controller.showTags = value.isNotEmpty;
            },
            decoration: InputDecoration(
              hintText: "Add a tag",
              hintStyle: TextStyleConstants.regularStyle(
                color: ColorConstants.lightBlueGrey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: ColorConstants.lightGrey,
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            ),
          ),
          20.verticalSpace,
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: controller.showTags
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: SizedBox(
              height: 50.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Colors.primaries.length,
                itemBuilder: (context, index) {
                  final Color color = Colors.primaries[index];
                  return GestureDetector(
                    onTap: () => controller.addColorToTag(color),
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: controller.isSelectedColor(color)
                              ? ColorConstants.primaryColor
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 20.r,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          20.verticalSpace.showByCondition(controller.showTags),
          SizedBox(
            height: 40.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.allTags.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final TagModel tag = controller.allTags[index];
                return TagCard(
                  onTap: () {
                    controller.addOrRemoveTag(tag);
                  },
                  tag: tag,
                );
              },
            ),
          ),
          20.verticalSpace,
          MaterialButton(
            onPressed: () => controller.saveTagModel(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            color: ColorConstants.primaryColor,
            child: Text(
              "Save",
              style:
                  TextStyleConstants.mediumStyle(color: ColorConstants.white),
            ),
          ),
          70.verticalSpace,
        ],
      ),
    );
  }
}
