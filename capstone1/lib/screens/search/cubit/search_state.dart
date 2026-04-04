import 'package:capstone1/model/single_recipe_model.dart';

abstract class SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<SingleRecipeModel> allRecipes;
  final List<SingleRecipeModel> listAfterSearch;

  SearchLoadedState({
    required this.allRecipes,
    required this.listAfterSearch,
  });
}

class SearchErrorStare extends SearchState {
  final String message;

  SearchErrorStare( {required this.message});
}