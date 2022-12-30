// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:dashboard/apps/prayersApp/features/authentication/authentication.dart';
import 'package:dashboard/core/apps.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../../../core/themes.dart';
import '../../../core/widgets.dart';
import '../register/register.dart';

class LoginForm extends ReactiveStatelessWidget {
  LoginForm({key}) : super(key: key);
  final obscure = RM.inject(() => true);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return OnFormBuilder(
      listenTo: loginForm,
      builder: () {
        return Scaffold(
          appBar: AppBar(
            title: Text('Login'),
            actions: [
              IconButton(
                onPressed: () {
                  RM.navigate.to(
                    RegisterForm(),
                  );
                },
                icon: Icon(Icons.open_in_new),
              ),
              AppSelectorToggle()
            ],
          ),
          body: Stack(
            children: [
              BackgroundWidget(size),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: TextFormField(
                            controller: emailLoginForm.controller,
                            focusNode: emailLoginForm.focusNode,
                            decoration: InputDecoration(
                              labelText: 'Type email',
                              errorText: emailLoginForm.error,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: TextFormField(
                            controller: passwordLoginForm.controller,
                            focusNode: passwordLoginForm.focusNode,
                            decoration: InputDecoration(
                              labelText: 'Type password',
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(padding),
                                child: IconButton(
                                  onPressed: () => obscure.toggle(),
                                  icon: Icon(obscure.state ? Icons.visibility : Icons.visibility_off),
                                ),
                              ),
                              errorText: passwordLoginForm.error,
                            ),
                            obscureText: obscure.state,
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
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: ElevatedButton(onPressed: loginForm.isValid ? loginForm.submit : null, child: Text('Login')),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
