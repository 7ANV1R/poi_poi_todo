import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_poi_todo/app/data/models/todo_model.dart';
import 'package:poi_poi_todo/app/modules/todo_home/controllers/todo_home_controller.dart';

class TodoCard extends GetView<TodoHomeController> {
  const TodoCard({Key? key, required this.todoModel}) : super(key: key);
  final TODOModel todoModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(todoModel.content!),
                ),
                Checkbox(
                  value: todoModel.done,
                  onChanged: (newValue) {
                    controller.updateTODO(newValue!, todoModel.todoID!);
                  },
                ),
              ],
            ),
            if (todoModel.done == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.deleteTODO(todoModel.todoID!);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
