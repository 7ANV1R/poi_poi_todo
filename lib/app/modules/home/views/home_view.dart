import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Form(
                  key: controller.dataAddingkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstFiledController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'email',
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Icon(Icons.data_saver_off),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: controller.lastFiledController,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: 'name',
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Icon(Icons.data_saver_off),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              controller.addDataToFirebase(
                controller.firstFiledController.text,
                controller.lastFiledController.text,
              );
              controller.firstFiledController.clear();
              controller.lastFiledController.clear();
            },
            child: Text('Submit Data'),
          ),
          Obx(
            () => ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.userData.length,
              itemBuilder: (context, index) => Card(
                  //color: Colors.red,
                  child: ListTile(
                title: Text(controller.userData[index].name!),
                subtitle: Text(controller.userData[index].email!),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: ElevatedButton(
              onPressed: controller.signout,
              child: Text('Sign out'),
            ),
          ),
        ],
      ),
    );
  }
}
