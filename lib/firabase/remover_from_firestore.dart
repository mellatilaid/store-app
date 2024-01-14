import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training/helper/const.dart';

Future<void> removerFromFireStore({required String id}) async {
  FirebaseFirestore.instance
      .collection(kUsersColRef)
      .doc(userDoc)
      .collection(kCartColRef)
      .doc(id)
      .delete();
}
