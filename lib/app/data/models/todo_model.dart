import 'package:cloud_firestore/cloud_firestore.dart';

class TODOModel {
  String? content;
  String? todoID;
  Timestamp? dateCreated;
  bool? done;
  TODOModel({this.content, this.todoID, this.dateCreated, this.done});

  TODOModel.fromDocumentSnapshot(DocumentSnapshot docSnapshot) {
    todoID = docSnapshot.id;
    content = docSnapshot["content"];
    dateCreated = docSnapshot["dateCreated"];
    done = docSnapshot["done"];
  }
}
