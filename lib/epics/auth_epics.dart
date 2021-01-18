import 'package:be_social/actions/auth/index.dart';
import 'package:be_social/actions/index.dart';
import 'package:be_social/models/auth/index.dart';
import 'package:be_social/models/index.dart';
import 'package:be_social/services/auth_service.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AuthEpics {
  const AuthEpics({@required AuthService authService})
      : assert(authService != null),
        _authService = authService;

  final AuthService _authService;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[TypedEpic<AppState, Login$>(_login)]);
  }

  Stream<AppAction> _login(Stream<Login$> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((Login$ action) => _authService.login(email: action.email, password: action.password))
        .map((AppUser appUser) => Login.successful(appUser))
        .onErrorReturnWith((dynamic error) => Login.error(error));
  }
}
