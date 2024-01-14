import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Color kTextColor = Colors.black;
const kPrimary = Color(0xff74CCCF);
const kUsersColRef = 'users';
const kCartColRef = 'myCart';
const fname = 'First Name';
const lname = 'Last Name';
const kemail = 'Email';
const kAmount = 'Amount';
const dateCreated = 'Date Created';
final userDoc = FirebaseAuth.instance.currentUser!.uid;
const kProductName = 'title';
const kProductPrice = 'price';
const kProductImage = 'image';
const kProductdesc = 'description';
const kProuductId = 'id';
const kErrorState = 'firstoreError';
