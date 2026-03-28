part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

class ChangePageEvent extends BottomNavEvent {
  final int index;

  ChangePageEvent(this.index);
}