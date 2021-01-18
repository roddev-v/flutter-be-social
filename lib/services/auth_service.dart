part of services;

class AuthService {
  const AuthService({@required FirebaseAuth firebaseAuth, @required FirebaseFirestore firebaseFirestore})
      : assert(firebaseAuth != null),
        assert(firebaseFirestore != null),
        _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  Future<AppUser> login({@required String email, @required String password}) async {
    final UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    final DocumentSnapshot snapshot = await _firebaseFirestore.doc('users/${result.user.uid}').get();
    return AppUser.fromJson(snapshot.data());
  }
}
