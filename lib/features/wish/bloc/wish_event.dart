part of 'wish_bloc.dart';

@immutable
sealed class WishEvent {}

class WishInitialEvent extends WishEvent {}

class WishLoadingEvent extends WishEvent {}

class WishSuccessEvent extends WishEvent {}

class WishSErrorEvent extends WishEvent {}

class WishUnlikeWishEvent extends WishEvent {
  final DataModel wishItem;

  WishUnlikeWishEvent({required this.wishItem});
}
class WishAddTocartEvent extends WishEvent{
  final DataModel wishItem;

  WishAddTocartEvent({required this.wishItem});

}

class WishNavigateToHomeEvent extends WishEvent {}

class WishNavigateCartEvent extends WishEvent {}
