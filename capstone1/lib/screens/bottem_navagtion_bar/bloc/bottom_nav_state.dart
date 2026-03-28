part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavState {}

final class BottomNavInitial extends BottomNavState {}

class CurrentIndexState extends BottomNavState{
  final int currentIndex;

  CurrentIndexState({required this.currentIndex});
}