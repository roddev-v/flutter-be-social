import 'package:be_social/actions/auth/index.dart';
import 'package:be_social/models/auth/index.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authReducer =
    combineReducers(<Reducer<AuthState>>[TypedReducer<AuthState, LoginSuccessful>(_loginSuccessful)]);

AuthState _loginSuccessful(AuthState state, LoginSuccessful action) {
  return state.rebuild((AuthStateBuilder b) => b.user = action.user.toBuilder());
}
