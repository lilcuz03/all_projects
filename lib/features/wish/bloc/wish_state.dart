part of 'wish_bloc.dart';

@immutable
sealed class WishState {}

abstract class WishActionState extends WishState {}

final class WishInitial extends WishState {}

class WishInitialState extends WishState {}

class WishLoadingState extends WishState {}

class WishSuccessState extends WishState {
  final List<DataModel> wishItems;
  WishSuccessState({required this.wishItems});
}

class WishErrorState extends WishState {}

class WishUnlikeWishState extends WishActionState {}
class WishAddTocartState extends WishActionState {}

class WishNavigateToHomeState extends WishActionState {}

class WishNavigateToCartState extends WishActionState {}
