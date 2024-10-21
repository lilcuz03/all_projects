part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<DataModel> dataModel;

  HomeSuccessState({required this.dataModel});
}

class HomeErrorState extends HomeState {}

class HomeAddToCartState extends HomeActionState {}

class HomeAddToWishState extends HomeActionState {}

class HomeNavigateToCartState extends HomeActionState {}

class HomeNavigateToWishState extends HomeActionState {}
