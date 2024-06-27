
part of '../view/home_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeViewModel>();
    return Column(
      children: [
        TabBar(
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelStyle: TextStyleConstants.semiBoldStyle(
              color: ColorConstants.primaryColor),
          unselectedLabelStyle: TextStyleConstants.semiBoldStyle(
              color: ColorConstants.secondaryColor),
          indicatorColor: ColorConstants.primaryColor,
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
              color: ColorConstants.green,
            ),
            Container(
              color: ColorConstants.red,
            ),
            Container(
              color: ColorConstants.primaryColor,
            )
          ]),
        )
      ],
    );
  }
}
