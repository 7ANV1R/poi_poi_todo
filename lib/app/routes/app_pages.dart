import 'package:get/get.dart';

import 'package:poi_poi_todo/app/modules/home/bindings/home_binding.dart';
import 'package:poi_poi_todo/app/modules/home/views/home_view.dart';
import 'package:poi_poi_todo/app/modules/login/bindings/login_binding.dart';
import 'package:poi_poi_todo/app/modules/login/views/login_view.dart';
import 'package:poi_poi_todo/app/modules/signup/bindings/signup_binding.dart';
import 'package:poi_poi_todo/app/modules/signup/views/signup_view.dart';
import 'package:poi_poi_todo/app/modules/todo_home/bindings/todo_home_binding.dart';
import 'package:poi_poi_todo/app/modules/todo_home/views/todo_home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TODO_HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.TODO_HOME,
      page: () => TodoHomeView(),
      binding: TodoHomeBinding(),
    ),
  ];
}
