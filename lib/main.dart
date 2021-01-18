import 'package:be_social/presentation/app_routes.dart';
import 'package:be_social/presentation/mixins/init_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'models/index.dart';

void main() => runApp(const BeSocial());

class BeSocial extends StatefulWidget {
  const BeSocial({Key key}) : super(key: key);

  @override
  _BeSocialState createState() => _BeSocialState();
}

class _BeSocialState extends State<BeSocial> with InitMixin<BeSocial> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Store<AppState>>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<Store<AppState>> snapshot) {
        print(snapshot.hasData);
        if (snapshot.hasData) {
          final Store<AppState> store = snapshot.data;
          return StoreProvider<AppState>(
              store: store, child: MaterialApp(title: 'be social', theme: ThemeData.dark(), routes: AppRoutes.routes));
        } else {
          if (snapshot.hasError) {
            throw snapshot.error;
          }
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: FlutterLogo(size: 150.0),
              ),
            ),
          );
        }
      },
    );
  }
}
