import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
                key: controller.loginFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.emailTextController,
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
                      textInputAction: TextInputAction.search,
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
                        controller.login(
                            controller.emailTextController.text, controller.passTextController.text);
                      },
                      child: const Text('Log in'),
                    ),
                    TextButton(
                      onPressed: controller.onTapSignUp,
                      child: const Text('Sign up'),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
