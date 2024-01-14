import 'package:cloud_firestore/cloud_firestore.dart';

import '../helper/const.dart';

Future<void> buyAndUpdateBalance(
    {required double balance, required double totProductsPrice}) async {
  try {
    DocumentReference userRefrence =
        FirebaseFirestore.instance.collection(kUsersColRef).doc(userDoc);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        userRefrence,
        {
          kAmount: balance - totProductsPrice,
        },
      );
    });
  } catch (e) {
    throw Exception(e.toString());
  }
}
