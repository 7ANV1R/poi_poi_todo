import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/models/todo_model.dart';

class TodoHomeController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  RxList<TODOModel> todoList = RxList<TODOModel>();
  // ignore: invalid_use_of_protected_member
  List<TODOModel> get todos => todoList.value;
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    todoList.bindStream(getToDoByStream());
    super.onInit();
  }

  @override
  void onClose() {}

  final TextEditingController inputController = TextEditingController();

  //move to db

  Future<void> addToDoInDB(String content) async {
    try {
      await firebaseFirestore.collection("consumers").add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
      rethrow;
    }
  }

  Stream<List<TODOModel>> getToDoByStream() {
    return firebaseFirestore
        .collection("consumers")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((query) {
      List<TODOModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(TODOModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
