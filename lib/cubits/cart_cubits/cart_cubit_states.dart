import '../../models/product_model.dart';

class CartState {
  CartState();
}

class CartIniatialState extends CartState {}

class CartProductsState extends CartState {
  final List<ProductModel> products;
  CartProductsState({required this.products});
}

class BuySuccessState extends CartState {}

class BuyFailedState extends CartState {
  final String errMessage;

  BuyFailedState({required this.errMessage});
}

class BuyLoadingState extends CartState {}

class NotEnoughBalanceState extends CartState {}
