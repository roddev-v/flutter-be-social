import 'dart:async';

import 'package:be_social/init/init.dart';
import 'package:be_social/models/index.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

mixin InitMixin<S extends StatefulWidget> on State<S> {
  final Completer<Store<AppState>> _completer = Completer<Store<AppState>>();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final List<dynamic> result =
        await Future.wait<dynamic>(<Future<void>>[init(), Future<void>.delayed(const Duration(seconds: 3))]);
    _completer.complete(result[0] as Store<AppState>);
  }

  Future<Store<AppState>> get future => _completer.future;
}
