import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_auth/controllers/auth_controller.dart';
import 'package:prueba_auth/navigation/routes.dart';

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: authController,
        builder: (_) {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routes.routes,
          );
        });
  }
}
