import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practise/core/data/model/data_model.dart';
import 'package:bloc_practise/features/cart/data/cart_items.dart';
import 'package:flutter/material.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartLoadingEvent>(cartLoadingEvent);
    on<CartSuccessEvent>(cartSuccessEvent);
    on<CartErrorEvent>(cartErrorEvent);
    on<CartNavigateToCheckoutEvent>(cartNavigateToCheckoutEvent);
    on<CartNavigateToWishEvent>(cartNavigateToWishEvent);
    on<CartNavigateToHomeEvent>(cartNavigateToHomeEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartLoadingEvent(
      CartLoadingEvent event, Emitter<CartState> emit) {
    emit(CartLoadingState());
  }

  FutureOr<void> cartSuccessEvent(
      CartSuccessEvent event, Emitter<CartState> emit) {}

  FutureOr<void> cartErrorEvent(CartErrorEvent event, Emitter<CartState> emit) {
    emit(CartErrorState());
  }

  FutureOr<void> cartNavigateToCheckoutEvent(
      CartNavigateToCheckoutEvent event, Emitter<CartState> emit) {
    emit(CartNavigateToCheckoutState());
  }

  FutureOr<void> cartNavigateToWishEvent(
      CartNavigateToWishEvent event, Emitter<CartState> emit) {
    emit(CartNavigateToWishState());
    print('CartNavigateToWishEvent');
  }

  FutureOr<void> cartNavigateToHomeEvent(
      CartNavigateToHomeEvent event, Emitter<CartState> emit) {
    emit(CartNavigateToHomeState());
    print('CartNavigateToHomeEvent clicked ');
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.removedItem);
    // emit(CartRemoveFromCartState());
    // emit(CartSuccessState(cartItems: cartItems));

    print('CartRemoveFromCartEvent clicked');
  }
}
