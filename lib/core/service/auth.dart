import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_app/feature/Signup/view/signup_view.dart';

import '../../feature/LogIn/view/login_view.dart';
import '../../feature/UserProfile/view/userprofile_view.dart';

class Authentication {
  Future<User?> emailSignIn(
      {required String email, required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for this email');
      }
    }
    return user;
  }

  Future<User?> createUser(
      {required String email, required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      //if (e.code == 'user-not-found') {
      print('Didnt created');
      //    }
    }
    return user;
  }

  Future<FirebaseApp> initializeFirebase(
      {required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignUp()));
    }
    return firebaseApp;
  }

  Future<void> singOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshed = auth.currentUser;
    return refreshed;
  }
}
