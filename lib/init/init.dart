import 'package:be_social/epics/app_epics.dart';
import 'package:be_social/reducers/app_reducer.dart';
import 'package:be_social/services/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import '../models/index.dart';

Future<Store<AppState>> init() async {
  // Firebase
  await Firebase.initializeApp();
  final AppState initialState = AppState.initialState();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Services
  final AuthService authService = AuthService(firebaseAuth: firebaseAuth, firebaseFirestore: firebaseFirestore);
  final Epic<AppState> epics = AppEpics(authService: authService).epics;
  return Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: <Middleware<AppState>>[EpicMiddleware<AppState>(epics)],
  );
}
