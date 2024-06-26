import 'package:provider/provider.dart';
import 'package:todo_app/src/pages/home/viewModel/home_view_model.dart';

// Uygulamayla ilgili temel veriler
class AppConstants {
  static const appName = 'Before Sunset AI Todo App';
  static final defaultProviders = [
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
    ),
  ];
}
