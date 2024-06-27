import 'package:provider/provider.dart';
import 'package:todo_app/src/pages/home/viewModel/home_view_model.dart';

// Uygulamayla ilgili temel veriler
class AppConstants {
  static const appName = 'Before Sunset AI Todo App';
  static String defaultImageUrl =
      "https://www.perfocal.com/blog/content/images/size/w960/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg";
  static final defaultProviders = [
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
    ),
  ];
}
