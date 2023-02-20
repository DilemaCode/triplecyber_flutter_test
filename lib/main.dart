import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:triplecyber_test/global/controllers/global.controller.dart';
import 'package:triplecyber_test/routes/app.pages.dart';
import 'package:triplecyber_test/routes/app.routes.dart';
import 'package:triplecyber_test/theme/app.theme.dart';

void main()async {
  await dotenv.load(fileName: ".env");
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: appTheme,
      initialBinding:
          BindingsBuilder(() => Get.put<GlobalController>(GlobalController())),
      onReady: () {
        if (Get.currentRoute != AppRoutes.Home) {
          Get.offAndToNamed(AppRoutes.Home);
        }
      },
    ),
  );
}
