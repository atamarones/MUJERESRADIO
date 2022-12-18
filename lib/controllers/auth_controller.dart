import 'dart:async';

import 'package:get/get.dart';
import 'package:prueba_auth/repository/auth_repository.dart';

import '../navigation/routes.dart';

enum AuthState {
  signedOut,
  signedIn,
}

class AuthController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();
  late StreamSubscription _authSuscription;
  final Rx<AuthState> authState = Rx(AuthState.signedOut);
  final Rx<AuthUser?> authUser = Rx(null);

  void _authStateChanged(AuthUser? user) {
    if (user == null) {
      authState.value = AuthState.signedOut;
      Get.offAllNamed(Routes.intro);
    } else {
      authState.value = AuthState.signedIn;
      Get.offAllNamed(Routes.home);
    }
    authUser.value = user;
  }

  @override
  void onInit() async {
    // Just for testing
    await Future.delayed(const Duration(seconds: 3));
    _authSuscription =
        _authRepository.onAuthStateChanged.listen(_authStateChanged);
    super.onInit();
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }

  @override
  void onClose() {
    _authSuscription.cancel();
    super.onClose();
  }
}
