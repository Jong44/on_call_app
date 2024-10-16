import 'package:get/get.dart';
import 'package:one_call_app/app/bindings/ChatBindings.dart';
import 'package:one_call_app/app/bindings/EmergencyDetailBindings.dart';
import 'package:one_call_app/app/bindings/GrupBindings.dart';
import 'package:one_call_app/app/bindings/IndexMainBindings.dart';
import 'package:one_call_app/app/bindings/LoginBindings.dart';
import 'package:one_call_app/app/bindings/MapBindings.dart';
import 'package:one_call_app/app/bindings/RegisterBindings.dart';
import 'package:one_call_app/app/views/auth/login/LoginPage.dart';
import 'package:one_call_app/app/views/auth/register/RegisterPage.dart';
import 'package:one_call_app/app/views/main/detail/ChatPage.dart';
import 'package:one_call_app/app/views/main/detail/EmergencyDetail.dart';
import 'package:one_call_app/app/views/main/detail/GrupDetailPage.dart';
import 'package:one_call_app/app/views/main/detail/MapPage.dart';
import 'package:one_call_app/app/views/main/indexMain.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: "/",
      page: () => const IndexMain(),
      binding: IndexMainBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/emergency-detail",
      page: () => const EmergencyDetail(),
      binding: EmergencyDetailBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/emergency-map",
      page: () => const MapPage(),
      binding: MapBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/login",
      page: () => const LoginPage(),
      binding: LoginBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/register",
      page: () => const RegisterPage(),
      binding: RegisterBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/grup/:id",
      page: () => const GrupDetailPage(),
      binding: GrupBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: "/grup/chat/:id",
      page: () => const ChatPage(),
      transition: Transition.fadeIn,
      binding: ChatBindings(),
    ),
  ];
}
