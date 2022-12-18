import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_auth/app.dart';
import 'package:prueba_auth/repository/auth_repository.dart';
import 'package:prueba_auth/repository/implementations/auth_repository.dart';
import 'package:prueba_auth/repository/implementations/my_user_repository.dart';
import 'package:prueba_auth/repository/my_user_repository.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = PostHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<AuthRepository>(AuthRepositoryImplementation());
  Get.put<MyUserRepository>(MyUserRepositoryImp());

  runApp(MyApp());
}
