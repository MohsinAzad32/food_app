import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/utils.dart';
import 'package:food_app/view/home.dart';
import 'package:food_app/view/login.dart';

class Auth {
  final auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return auth.currentUser;
  }

  Future register(BuildContext context,
      {required String email, required String password}) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        Utils.showBar(
          context,
          message: 'Registered Successfully',
        );
        Future.delayed(
          Duration(
            seconds: 2,
          ),
        );
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: LoginPage(),
            );
          },
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ));
      },
    ).onError(
      (error, stackTrace) {
        Utils.showBar(
          context,
          message: error.toString(),
        );
      },
    );
  }

  Future login(BuildContext context,
      {required String email, required String password}) async {
    return await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        Utils.showBar(
          context,
          message: 'Logged in Successfully',
        );
        Future.delayed(
          Duration(
            seconds: 2,
          ),
        );
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: HomePage(),
            );
          },
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ));
      },
    ).onError(
      (error, stackTrace) {
        Utils.showBar(
          context,
          message: error.toString(),
        );
      },
    );
  }

  Future logout(BuildContext context) async {
    await auth.signOut().then(
      (value) {
        Utils.showBar(context, message: 'Logged Out Successfully');
        Future.delayed(
          Duration(
            seconds: 2,
          ),
        );
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: LoginPage(),
            );
          },
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ));
      },
    ).onError(
      (error, stackTrace) {
        Utils.showBar(
          context,
          message: error.toString(),
        );
      },
    );
  }
}
