part of '../view/home_view.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.appbarBackgroundColor,
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
          color: ColorConstants.textColor.withOpacity(.04),
        ),
        child: Center(
          child: Text(
            "🌙 Thu, Nov 09",
            style: TextStyleConstants.regularStyle(
                color: ColorConstants.textColor),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child:  CircleAvatar(
            backgroundImage: NetworkImage(
              AppConstants.defaultImageUrl,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
