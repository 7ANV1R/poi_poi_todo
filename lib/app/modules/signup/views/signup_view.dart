import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignupView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
                key: controller.signupFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'email',
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Icon(Icons.email),
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: controller.passTextController,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: 'password',
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Icon(Icons.password),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.createUser(
                            controller.emailTextController.text, controller.passTextController.text);
                      },
                      child: const Text('Sign up'),
                    ),
                    TextButton(
                      onPressed: controller.onTapLogin,
                      child: const Text('Log in'),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
