import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/user_model.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rxn<User> _firebaseUser = Rxn<User>();

  String? get user => _firebaseUser.value?.email;

  final Rx<UserModel> _userModel = UserModel().obs;

  UserModel get userModel => _userModel.value;

  set userModel(UserModel value) => _userModel.value = value;

  RxList<UserModel> userData = RxList<UserModel>();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    collectionReference = firebaseFirestore.collection("users");

    userData.bindStream(getAllUserData());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void clear() {
    _userModel.value = UserModel();
  }

  late CollectionReference collectionReference;
  late Query query;

  Stream<List<UserModel>> getAllUserData() {
    return collectionReference
        .snapshots()
        .map((event) => event.docs.map((e) => UserModel.fromDocumentSnapshot(e)).toList());

    //final sorted = userData.sort((a, b) => a.name!.compareTo(b.name!));
  }

  GlobalKey<FormState> dataAddingkey = GlobalKey<FormState>();
  TextEditingController firstFiledController = TextEditingController();
  TextEditingController lastFiledController = TextEditingController();

  Future<void> addDataToFirebase(String email, String name) async {
    await collectionReference.add({
      'email': email,
      'name': name,
    });
  }

  void signout() async {
    try {
      await _auth.signOut();
      Get.offNamed(Routes.LOGIN);
    } catch (e) {
      Get.snackbar("Sign out Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
