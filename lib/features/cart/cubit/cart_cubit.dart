
import 'dart:developer';

import 'package:bloc_app/features/cart/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial(false));

  void addToCart()=>emit(CartAdded());
  void removeFromCart()=>emit(CartRemoved());

  @override
  Future<void> close() {
    log("CartCubit Closed");
    return super.close();
  }
}