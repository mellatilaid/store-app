import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:training/helper/show_snakbar.dart';

import '../bottom_navigation_view.dart';

Future<void> userLogIn(BuildContext context,
    {required String email, required String password}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Navigator.pushNamed(context, BottomNavPage.id);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'unknown-error') {
      showSnakBar(
        context,
        content: 'No user found for that email. \n or the password is wrong',
      );
    } else if (e.code == 'wrong-password') {
      showSnakBar(context, content: 'Wrong password provided for that user.');
    }
    print(e.code);
  } catch (e) {
    showSnakBar(context, content: e.toString());
  }
}
