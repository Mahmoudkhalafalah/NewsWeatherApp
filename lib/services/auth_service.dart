import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // Email & Password Sign In
  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    String? id;
    try {
      id = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user
          ?.uid;
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    return id;
  }

  Future signUp(
      String email, String firstPassword, String secondPassword) async {
    if (passwordConfirmed(firstPassword, secondPassword)) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: firstPassword,
        );
      } on Exception catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  // GET UID
  Future<String?> getCurrentUID() async {
    return (_firebaseAuth.currentUser?.uid);
  }

  // GET CURRENT USER
  Future getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  // Sign Out
  signOut() {
    return _firebaseAuth.signOut();
  }

  bool passwordConfirmed(String firstPassword, String secondPassword) {
    return (firstPassword == secondPassword);
  }
}
