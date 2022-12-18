import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_auth/controllers/home_signin_controller.dart';
import 'package:prueba_auth/screens/signin_screen/components/sign_form.dart';
import 'package:prueba_auth/components/size_config.dart';

import '../../../navigation/routes.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeSignInController = Get.find<HomeSignInController>();
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Image.asset(
              'assets/images/logo_final.png',
              height: getProportionateScreenHeight(150),
              width: getProportionateScreenWidth(150),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Regístrate o ingresa para continuar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: homeSignInController.isLoading.value,
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
            Obx(
              () => Visibility(
                visible: homeSignInController.error.value?.isNotEmpty == true,
                child: Text(
                  homeSignInController.error.value ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 24.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  LoginButton(
                    text: 'Continuar con Google',
                    icon: 'assets/icons/google-icon.svg',
                    color: Colors.white,
                    textColor: Colors.blueGrey,
                    onTap: () => homeSignInController.signInWithGoogle(),
                  ),
                  const SizedBox(height: 20),
                  LoginButton(
                    text: 'Continuar con Facebook',
                    icon: 'assets/icons/facebook-2.svg',
                    color: Colors.blueAccent,
                    onTap: () => homeSignInController.signInWithFacebook(),
                  ),
                  const SizedBox(height: 20),
                  LoginButton(
                    text: 'Continuar con tu email',
                    icon: 'assets/icons/email-2.svg',
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    onTap: () => Get.toNamed(Routes.signInEmail),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    child: const Text('Create an account'),
                    onPressed: () => Get.toNamed(Routes.createAccount),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
