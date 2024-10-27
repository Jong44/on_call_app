import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:one_call_app/app/config/ColorConfig.dart';
import 'package:one_call_app/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
  handleIncomingLinks();
}

void handleIncomingLinks() {
  const platform = MethodChannel('com.example.one_call_app/channel');
  platform.setMethodCallHandler((call) async {
    if (call.method == 'getInitialUri') {
      final String uri = call.arguments; // Ambil URI
      if (uri.startsWith('myapp://open')) {
        print('URI: $uri');
        Get.toNamed('/emergency-detail');
      }
    }
  });
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print('Workmanager executed');
    if (task == 'changePage') {
      for (int i = 0; i < 10; i++) {
        print('Workmanager executed $i');
        await Future.delayed(const Duration(seconds: 1));
      }
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('changePageTriggered', true);
    }
    return Future.value(true);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One Call App',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: ColorConfig.primaryColor),
        useMaterial3: true,
      ),
      getPages: AppPages.pages,
      initialRoute: '/auth',
    );
  }
}
