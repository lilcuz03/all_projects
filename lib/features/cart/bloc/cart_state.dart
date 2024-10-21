part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final List<DataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

class CartErrorState extends CartState {}
class CartRemoveFromCartState extends CartState {}

class CartNavigateToCheckoutState extends CartActionState {}

class CartNavigateToHomeState extends CartActionState {}

class CartNavigateToWishState extends CartActionState {}
