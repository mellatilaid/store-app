import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubits/cart_cubits/cart_cubit_states.dart';
import 'package:training/firabase/add_to_firestore.dart';
import 'package:training/firabase/buy_and_update_balance.dart';
import 'package:training/firabase/delete_collection.dart';
import 'package:training/firabase/remover_from_firestore.dart';
import 'package:training/firabase/send_money_update_balance.dart';
import 'package:training/models/product_model.dart';

class ManageCartCubit extends Cubit<CartState> {
  ManageCartCubit() : super(CartState());
  List<ProductModel> items = [];
  double totalPrice = 0;
  int productsCount = 0;

  addToCart({required ProductModel product}) async {
    try {
      items.add(product);
      totalPrice += product.price;
      roundNumber(totalPrice);
      productsCount++;

      emit(CartProductsState(
        products: items,
      ));
      await addToFireStore(product: product);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  removerFromCart(
      {required ProductModel product, bool isFromCart = false}) async {
    try {
      items.remove(product);
      totalPrice -= product.price;
      roundNumber(totalPrice);
      productsCount--;

      emit(CartProductsState(
        products: items,
      ));
      await removerFromFireStore(id: product.title);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  roundNumber(double value) {
    num val = pow(10.0, 2);
    totalPrice = ((value * val).round().toDouble() / val);
  }

  buyProducts() async {
    try {
      var balance = await getBalanceFromFireStore();

      if (balance >= totalPrice) {
        await buyAndUpdateBalance(
            balance: balance, totProductsPrice: totalPrice);
        await deleteCollection();
        totalPrice = 0;
        productsCount = 0;
        items = [];
        emit(BuySuccessState());
        Timer(const Duration(seconds: 5), () {
          emit(CartIniatialState());
        });
      } else {
        emit(NotEnoughBalanceState());
        Timer(const Duration(seconds: 5), () {
          emit(CartProductsState(products: items));
        });
      }
    } catch (e) {
      emit(BuyFailedState(errMessage: e.toString()));
      Timer(const Duration(seconds: 5), () {
        emit(CartProductsState(products: items));
      });
    }
  }
}
