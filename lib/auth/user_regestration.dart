import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/show_snakbar.dart';

Future<void> userRegestration(BuildContext context,
    {required String email, required String password}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showSnakBar(
        context,
        content: 'enter a strong password',
      );
    } else if (e.code == 'email-already-in-use') {
      showSnakBar(
        context,
        content: 'This Email Is Aleardy in use',
      );
    }
  } catch (e) {
    showSnakBar(context, content: e.toString());
  }
}
