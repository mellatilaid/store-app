import 'package:cloud_firestore/cloud_firestore.dart';

import '../helper/const.dart';

Future<void> chargeWallet({required String amount}) async {
  double amountAdded = double.parse(amount);
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection(kUsersColRef).doc(userDoc);
  if (amountAdded <= 100) {
    await documentReference.update(
      {
        kAmount: FieldValue.increment(amountAdded),
      },
    );
  }
}
