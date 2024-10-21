import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practise/core/data/model/data_model.dart';
import 'package:bloc_practise/features/cart/data/cart_items.dart';
import 'package:bloc_practise/features/wish/data/wish_items.dart';
import 'package:flutter/material.dart';

part 'wish_event.dart';
part 'wish_state.dart';

class WishBloc extends Bloc<WishEvent, WishState> {
  WishBloc() : super(WishInitial()) {
    on<WishInitialEvent>(wishInitialEvent);
    on<WishLoadingEvent>(wishLoadingEvent);
    on<WishSuccessEvent>(wishSuccessEvent);
    on<WishSErrorEvent>(wishSErrorEvent);
    on<WishUnlikeWishEvent>(wishUnlikeWishEvent);
    on<WishNavigateToHomeEvent>(wishNavigateToHomeEvent);
    on<WishNavigateCartEvent>(wishNavigateCartEvent);
    on<WishAddTocartEvent>(wishAddToCartEvent);
  }

  FutureOr<void> wishInitialEvent(
      WishInitialEvent event, Emitter<WishState> emit) {
    // emit(WishInitialState());
    emit(WishSuccessState(wishItems: wishItems));
  }

  FutureOr<void> wishLoadingEvent(
      WishLoadingEvent event, Emitter<WishState> emit) {
    emit(WishLoadingState());
  }

  FutureOr<void> wishSuccessEvent(
      WishSuccessEvent event, Emitter<WishState> emit) {
    emit(WishSuccessState(wishItems: wishItems
        // .map((item) => DataModel(
        //       price: item['price'],
        //       id: item['id'],
        //       name: item['name'],
        //       category: item['category'],
        //       stock: item['stock'],
        //       rating: item['rating'],
        //       onSale: item['onSale'],
        //       imageUrl: item['imageUrl'],
        //     ))
        // .toList()
        ));
  }

  FutureOr<void> wishSErrorEvent(
      WishSErrorEvent event, Emitter<WishState> emit) {
    emit(WishErrorState());
  }

  FutureOr<void> wishUnlikeWishEvent(
      WishUnlikeWishEvent event, Emitter<WishState> emit) {
    wishItems.remove(event.wishItem);
    emit(WishSuccessState(wishItems: wishItems));
  }

  FutureOr<void> wishNavigateToHomeEvent(
      WishNavigateToHomeEvent event, Emitter<WishState> emit) {
    print('WishNavigateToHomeEvent clicked');
    emit(WishNavigateToHomeState());
  }

  FutureOr<void> wishNavigateCartEvent(
      WishNavigateCartEvent event, Emitter<WishState> emit) {
    emit(WishNavigateToCartState());
  }

  FutureOr<void> wishAddToCartEvent(
      WishAddTocartEvent event, Emitter<WishState> emit) {
    cartItems.add(event.wishItem);
    emit(WishSuccessState(wishItems: wishItems));
  }
}
