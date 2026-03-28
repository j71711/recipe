part of 'home_nav_bloc.dart';

@immutable
sealed class HomeNavState {}

final class HomeNavInitial extends HomeNavState {}

final class HomeNavChangedState extends HomeNavState {
  final int currentIndex;

  HomeNavChangedState({required this.currentIndex});
}