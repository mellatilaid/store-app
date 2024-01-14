import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training/helper/const.dart';

Future<void> sendMoneyAndUpdateBalance(
    {required receiverId,
    required double balance,
    required String sentMoney}) async {
  var sentAmount = double.parse(sentMoney);

  String uid = FirebaseAuth.instance.currentUser!.uid;

  try {
    DocumentReference userRefrence =
        FirebaseFirestore.instance.collection(kUsersColRef).doc(uid);

    DocumentReference receiverRefrence =
        FirebaseFirestore.instance.collection(kUsersColRef).doc(receiverId);
    //var balance = await getBalanceFromFireStore();

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(
        receiverRefrence,
        {
          kAmount: FieldValue.increment(sentAmount),
        },
      );
      transaction.update(
        userRefrence,
        {
          kAmount: balance - sentAmount,
        },
      );
      /*if (balance >= sentAmount) {
        transaction.update(
          receiverRefrence,
          {
            kAmount: FieldValue.increment(sentAmount),
          },
        );
        transaction.update(
          userRefrence,
          {
            kAmount: balance - sentAmount,
          },
        );
      } else {}*/
    });
  } catch (e) {
    throw Exception(e.toString());
  }
}

Future<double> getBalanceFromFireStore() async {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  try {
    DocumentReference userRefrence =
        FirebaseFirestore.instance.collection(kUsersColRef).doc(uid);

    return FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot userSnap = await transaction.get(userRefrence);
      var currentAmount = (userSnap.data() as Map<String, dynamic>)[kAmount];
      print(currentAmount);
      return currentAmount;
    });
  } catch (e) {
    throw Exception(e.toString());
  }
}
