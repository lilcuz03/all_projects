part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartLoadingEvent extends CartEvent {}

class CartSuccessEvent extends CartEvent {}

class CartErrorEvent extends CartEvent {}

class CartNavigateToCheckoutEvent extends CartEvent {}

class CartNavigateToWishEvent extends CartEvent {}

class CartNavigateToHomeEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final DataModel removedItem;

  CartRemoveFromCartEvent({required this.removedItem});
}
