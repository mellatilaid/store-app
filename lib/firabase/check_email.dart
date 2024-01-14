import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../helper/const.dart';

Future<List<dynamic>> validateEmail({required String receiverEmail}) async {
  try {
    CollectionReference colRef =
        FirebaseFirestore.instance.collection(kUsersColRef);
    String uid = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot =
        await colRef.where(kemail, isEqualTo: receiverEmail).get();
    if (querySnapshot.docs.isNotEmpty && querySnapshot.docs.first.id != uid) {
      return [true, querySnapshot.docs.first.id];
    } else {
      return [false];
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}
