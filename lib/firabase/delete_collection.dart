import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training/helper/const.dart';

Future deleteCollection() async {
  CollectionReference collRef = FirebaseFirestore.instance
      .collection(kUsersColRef)
      .doc(userDoc)
      .collection(kCartColRef);

  collRef.get().then((snapshot) {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    for (var element in snapshot.docs) {
      batch.delete(element.reference);
    }
    batch.commit();
  });
}
