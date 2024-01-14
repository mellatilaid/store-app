import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/bottom_navigation_view.dart';
import 'package:training/cubits/cart_cubits/cart_cubit.dart';
import 'package:training/cubits/transaction_cubit/transaction_cubit.dart';
import 'package:training/views/cart_view.dart';
import 'package:training/views/home_view.dart';
import 'package:training/views/register_view.dart';
import 'package:training/views/sign_in_view.dart';
import 'package:training/views/update_product_view.dart';
import 'package:training/views/wallet_view.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool needsWeb = Platform.isLinux | Platform.isWindows;
  await Firebase.initializeApp(
    options: needsWeb
        ? DefaultFirebaseOptions.web
        : DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ManageCartCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SignInPage.id: (context) => const SignInPage(),
          RegisterPage.id: (context) => const RegisterPage(),
          HomePage.id: (context) => const HomePage(),
          UpdateProductPage.id: (context) => const UpdateProductPage(),
          BottomNavPage.id: (context) => const BottomNavPage(),
          CartPage.id: (context) => const CartPage(),
          WalletPage.id: (context) => const WalletPage(),
        },
        initialRoute: SignInPage.id,
      ),
    );
  }
}


/* BlocProvider(
      create: (context) => ManageCartCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SignInPage.id: (context) => const SignInPage(),
          RegisterPage.id: (context) => RegisterPage(),
          HomePage.id: (context) => const HomePage(),
          UpdateProductPage.id: (context) => const UpdateProductPage(),
          BottomNavPage.id: (context) => const BottomNavPage(),
          CartPage.id: (context) => const CartPage(),
        },
        initialRoute: SignInPage.id,
      ),
    );*/