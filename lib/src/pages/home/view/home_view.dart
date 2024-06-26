import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/core/constants/textStyles/text_style_constants.dart';
import 'package:todo_app/src/core/extensions/bottom_sheet_extension.dart';
import 'package:todo_app/src/core/mixins/show_bar.dart';
import 'package:todo_app/src/core/services/navigation/navigation_service.dart';
import 'package:todo_app/src/pages/home/model/todo_model.dart';
import 'package:todo_app/src/pages/home/view/today_view.dart';
import 'package:todo_app/src/pages/home/widget/add_task_sheet.dart';
import 'package:todo_app/src/pages/home/widget/custom_card.dart';
import '../../../core/base/view/base_view.dart';
import '../viewModel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      justConsumer: true,
      onPageBuilder: (context, controller, child) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
              appBar: buildAppBar(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: SizedBox(
                width: 64.h,
                height: 64.h,
                child: FloatingActionButton(
                  backgroundColor: const Color(0xff3396A1),
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
              ),
              body: Column(
                children: [
                  TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    labelStyle: TextStyleConstants.semiBoldStyle(
                        color: const Color(0xff3396A1)),
                    unselectedLabelStyle: TextStyleConstants.semiBoldStyle(
                        color: const Color(0xff75A3AD)),
                    indicatorColor: const Color(0xff3396A1),
                    tabs: const [
                      Tab(
                        text: "Today",
                      ),
                      Tab(
                        text: "Tomorrow",
                      ),
                      Tab(
                        text: "Rest of Week",
                      ),
                      Tab(
                        text: "Later of Week",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      TodayView(
                        todos: controller.todos,
                      ),
                      Container(
                        color: Colors.yellow,
                      ),
                      Container(
                        color: Colors.red,
                      ),
                      Container(
                        color: Colors.orange,
                      )
                    ]),
                  )
                ],
              )),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffE6F2F3),
      leading: IconButton(
        onPressed: () {
          NavigationService.instance.pop();
        },
        icon: const Icon(Icons.arrow_back),
      ),
      centerTitle: false,
      title: Container(
        width: 120.w,
        height: 28.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff111718).withOpacity(.04),
        ),
        child: Center(
          child: Text(
            "🌙 Thu, Nov 09",
            style:
                TextStyleConstants.regularStyle(color: const Color(0xff111718)),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://www.perfocal.com/blog/content/images/size/w960/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg",
            ),
          ),
        ),
      ],
    );
  }
}
