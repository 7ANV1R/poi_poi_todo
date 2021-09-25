import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:poi_poi_todo/app/modules/todo_home/widgets/todo_card.dart';

import '../controllers/todo_home_controller.dart';

class TodoHomeView extends GetView<TodoHomeController> {
  const TodoHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TodoHomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Add your TODO',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.inputController,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (controller.inputController.text != "") {
                          controller.addToDoInDB(controller.inputController.text);
                          controller.inputController.clear();
                        }
                      },
                      icon: Icon(Icons.add))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Your TODO',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(
              () => controller.todoList.isEmpty
                  ? Container()
                  : ListView.builder(
                      itemCount: controller.todos.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => TodoCard(todoModel: controller.todos[index]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
