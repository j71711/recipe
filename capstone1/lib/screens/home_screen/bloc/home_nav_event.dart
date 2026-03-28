part of 'home_nav_bloc.dart';

@immutable
sealed class HomeNavEvent {}

class ChangeHomeNavEvent extends HomeNavEvent {
  final int index;

  ChangeHomeNavEvent(this.index);
}