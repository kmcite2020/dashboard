// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../../../core/themes.dart';
import '../../../core/widgets.dart';

class RegisterForm extends ReactiveStatelessWidget {
  RegisterForm({key}) : super(key: key);
  final obscure = RM.inject(() => true);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register - enter your details'),
      ),
      body: Stack(
        children: [
          BackgroundWidget(size),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    // shrinkWrap: true,
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(padding),
                          child: TextFormField(
                              // controller: emailController.controller,
                              // focusNode: emailController.focusNode,
                              // decoration: InputDecoration(
                              //   labelText: 'Type email here.',
                              // ),
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(padding),
                        child: TextFormField(
                            // controller: passwordController.controller,
                            // focusNode: passwordController.focusNode,
                            // decoration: InputDecoration(
                            //   labelText: 'Type a safe password here',
                            //   suffixIcon: Padding(
                            //     padding: EdgeInsets.all(padding),
                            //     child: IconButton(
                            //       onPressed: () => obscure.toggle(),
                            //       icon: Icon(obscure.state ? Icons.visibility : Icons.visibility_off),
                            //     ),
                            //   ),
                            // ),
                            // obscureText: obscure.state,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(padding),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // signUpWithEmail(
                            //   context: context,
                            //   email: emailController.value,
                            //   password: passwordController.value,
                            // );
                          },
                          icon: Icon(Icons.password),
                          label: Text(
                            'Sign up  ',
                          ),
                        ),
                      )
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
