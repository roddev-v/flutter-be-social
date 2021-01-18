import 'package:be_social/presentation/home.dart';
import 'package:flutter/cupertino.dart';

// ignore: avoid_classes_with_only_static_members
class AppRoutes {
  static String home = '/';

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const Home()
  };
}
