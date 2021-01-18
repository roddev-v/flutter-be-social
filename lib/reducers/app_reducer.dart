import 'package:be_social/models/index.dart';
import 'package:be_social/reducers/auth_reducer.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  _reducer,
]);

AppState _reducer(AppState state, dynamic action) {
  return state.rebuild((AppStateBuilder b) {
    b.auth = authReducer(state.auth, action).toBuilder();
  });
}
