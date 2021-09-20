import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_poi_todo/app/routes/app_pages.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

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

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.offNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("Sign in Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void onTapLogin() {
    Get.offNamed(Routes.LOGIN);
  }
}
