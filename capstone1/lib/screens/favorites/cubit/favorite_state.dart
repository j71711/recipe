part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class SuccessFavoriteState extends FavoriteState{
  final List<SingleRecipeModel> favorites;

  SuccessFavoriteState(this.favorites);
}