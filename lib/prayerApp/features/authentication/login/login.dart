// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../../core/themes.dart';
import '../../../core/widgets.dart';
import '../register/register.dart';

class LoginForm extends ReactiveStatelessWidget {
  LoginForm({key}) : super(key: key);
  final formLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        actions: [
          IconButton(
            onPressed: () {
              RM.navigate.to(
                RegisterForm(),
              );
            },
            icon: Icon(Icons.app_registration),
          )
        ],
      ),
      body: Stack(
        children: [
          BackgroundWidget(size),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Card(
                child: Form(
                  key: formLogin,
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(padding),
                          child: TextFormField(
                            // controller: emailController.controller,
                            // focusNode: emailController.focusNode,
                            decoration: InputDecoration(
                              labelText: 'Type email here.',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(padding),
                          child: TextFormField(
                              // controller: passwordController.controller,
                              // decoration: InputDecoration(
                              // labelText: 'Type password here.',
                              // ),
                              ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.all(padding),
                      //   child: ElevatedButton.icon(
                      //     icon: Icon(Icons.login),
                      //     onPressed: passwordController.value.isEmpty || emailController.value.isEmpty
                      //         ? null
                      //         : () {
                      //             signInWithEmail(email: emailController.value, password: passwordController.value, context: context);
                      //           },
                      //     label: Text(
                      //       'Sign in',
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.all(padding),
                      //   child: ElevatedButton.icon(
                      //     icon: Icon(Icons.password),
                      //     onPressed: emailController.value.isEmpty
                      //         ? null
                      //         : () {
                      //             auth.sendPasswordResetEmail(email: emailController.value);
                      //           },
                      //     label: Text(
                      //       'Reset Password',
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
