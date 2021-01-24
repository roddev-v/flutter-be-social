import 'dart:ui';

import 'package:be_social/utils/colors.dart';
import 'package:be_social/utils/spaces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pa16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Glad to see you again',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    const Text(
                      'Welcome!',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          color: CustomColors.accent),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: Form(
                  key: loginForm,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: psv10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('Email',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.highlight_remove_outlined,
                                    ),
                                    onPressed: () {
                                      usernameController.clear();
                                    },
                                  )),
                              controller: usernameController,
                              validator: (String value) {
                                if (value.isEmpty ||
                                    !value.contains('@') ||
                                    !value.contains('.')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: psv10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('Password',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextFormField(
                              decoration:
                                  const InputDecoration(hintText: 'Password'),
                              controller: passwordController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter a valid password';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: FlatButton(
                          onPressed: () {
                            if (loginForm.currentState.validate()) {
                              print('Valid');
                            }
                          },
                          color: CustomColors.accent,
                          textColor: Colors.white,
                          child: const Text('Log in'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(fontSize: 16.0),
                    text: "Don\'t have an accout? ",
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Register',
                          style: const TextStyle(color: CustomColors.accent),
                          recognizer: TapGestureRecognizer()..onTap = () {})
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
