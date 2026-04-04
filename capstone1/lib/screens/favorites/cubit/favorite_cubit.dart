import 'package:bloc/bloc.dart';
import 'package:capstone1/model/single_recipe_model.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<SingleRecipeModel> get favorite {
    if (state is SuccessFavoriteState) {
      return (state as SuccessFavoriteState).favorites;
    }
    return [];
  }

  bool isFavorite(SingleRecipeModel recipe) {
    return favorite.any((item) => item.id == recipe.id);
  }

  void toggleFavorite(SingleRecipeModel recipe) {
    final updated = List<SingleRecipeModel>.from(favorite);

    if (isFavorite(recipe)) {
      updated.removeWhere((item) => item.id == recipe.id);
    } else {
      updated.add(recipe);
    }

    emit(SuccessFavoriteState(updated));
  }
}