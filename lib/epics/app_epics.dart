import 'package:be_social/epics/auth_epics.dart';
import 'package:be_social/models/index.dart';
import 'package:be_social/services/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux_epics/redux_epics.dart';

class AppEpics {
  const AppEpics({@required AuthService authService})
      : assert(authService != null),
        _authService = authService;

  final AuthService _authService;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[AuthEpics(authService: _authService).epics]);
  }
}
