import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training/helper/const.dart';
import 'package:training/models/product_model.dart';

Future<void> addToFireStore({required ProductModel product}) async {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  await FirebaseFirestore.instance
      .collection(kUsersColRef)
      .doc(uid)
      .collection(kCartColRef)
      .doc(product.title)
      .set({
    kProuductId: product.id,
    kProductName: product.title,
    kProductPrice: product.price,
    kProductImage: product.image,
    kProductdesc: product.description,
  });
}
