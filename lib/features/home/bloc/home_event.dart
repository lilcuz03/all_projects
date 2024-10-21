part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}
class HomeInitialEvent extends HomeEvent{}
class HomeLoadingEvent extends HomeEvent{}
class HomeSuccessEvent extends HomeEvent{}
class HomeErrorEvent extends HomeEvent{}
// class HomeClickCartIconEvent extends HomeEvent{}
class HomeAddToCartEvent extends HomeEvent{
  final DataModel cartedItems;

  HomeAddToCartEvent({required this.cartedItems});
}
class HomeAddToWishEvent extends HomeEvent{
  final DataModel wishListedItems;

  HomeAddToWishEvent({required this.wishListedItems});
}
// class HomeClickedWishIconEvent extends HomeEvent{}
class HomeNavigateToCartIconEvent extends HomeEvent{}
class HomeNavigateToWishIconEvent extends HomeEvent{}