import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_poi_todo/app/modules/home/views/home_view.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rxn<User> _firebaseUser = Rxn<User>();

  String? get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("Login Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();

  void onTapSignUp() {
    Get.offNamed(Routes.SIGNUP);
  }

  Widget onLoggedIn() {
    return HomeView();
  }
}
