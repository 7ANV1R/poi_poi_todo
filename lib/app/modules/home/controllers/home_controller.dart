import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:poi_poi_todo/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

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

  void signout() async {
    try {
      await _auth.signOut();
      Get.offNamed(Routes.LOGIN);
    } catch (e) {
      Get.snackbar("Sign out Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
