import 'package:be_social/containers/auth/index.dart';
import 'package:be_social/models/auth/index.dart';
import 'package:be_social/presentation/home_page.dart';
import 'package:be_social/presentation/login_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext builder, AppUser user) {
        return user == null ? const LoginPage() : const HomePage();
      },
    );
  }
}
