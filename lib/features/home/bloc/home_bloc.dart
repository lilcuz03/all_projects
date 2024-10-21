import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practise/core/data/model/data_model.dart';
import 'package:bloc_practise/core/data/sample/data_sample.dart';
import 'package:bloc_practise/features/cart/data/cart_items.dart';
import 'package:bloc_practise/features/wish/data/wish_items.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeLoadingEvent>(homeLoadingEvent);
    on<HomeSuccessEvent>(homeSuccessEvent);
    on<HomeErrorEvent>(homeErrorEvent);
    on<HomeAddToCartEvent>(homeAddToCartEvent);
    on<HomeAddToWishEvent>(homeAddToWishEvent);
    on<HomeNavigateToCartIconEvent>(homeNavigateToCartIconEvent);
    on<HomeNavigateToWishIconEvent>(homeNavigateToWishIconEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    // await Future.delayed(const Duration(seconds: 3));
    emit(HomeSuccessState(
        dataModel: productList
            .map((item) => DataModel(
                  price: item['price'],
                  id: item['id'],
                  name: item['name'],
                  category: item['category'],
                  stock: item['stock'],
                  rating: item['rating'],
                  onSale: item['onSale'],
                  imageUrl: item['imageUrl'],
                ))
            .toList()));
  }

  FutureOr<void> homeLoadingEvent(
      HomeLoadingEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
  }

  FutureOr<void> homeSuccessEvent(
      HomeSuccessEvent event, Emitter<HomeState> emit) {
    // emit(HomeSuccessState(dataModel: dataModel));
  }

  FutureOr<void> homeErrorEvent(HomeErrorEvent event, Emitter<HomeState> emit) {
    emit(HomeErrorState());
  }

  FutureOr<void> homeAddToCartEvent(
      HomeAddToCartEvent event, Emitter<HomeState> emit) {
    print('HomeAddToCartEvent clicked');

    cartItems.add(event.cartedItems);
    emit(HomeAddToCartState());
  }

  FutureOr<void> homeAddToWishEvent(
      HomeAddToWishEvent event, Emitter<HomeState> emit) {
    print('HomeAddToWishEvent clicked');
    wishItems.add(event.wishListedItems);
    emit(HomeAddToWishState());
  }

  FutureOr<void> homeNavigateToCartIconEvent(
      HomeNavigateToCartIconEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartState());
  }

  FutureOr<void> homeNavigateToWishIconEvent(
      HomeNavigateToWishIconEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishState());
  }
}
