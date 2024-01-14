import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training/helper/const.dart';

Future<void> addUserDetails(
    {required String fName,
    required String lName,
    required String email}) async {
  await FirebaseFirestore.instance
      .collection(kUsersColRef)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set({
    fname: fName,
    lname: lName,
    kemail: email,
    kAmount: 0,
  });
}
