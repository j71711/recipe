import 'package:bloc/bloc.dart';
import 'package:capstone1/model/single_recipe_model.dart';
import 'package:capstone1/repo/recipe_repo.dart';
import 'package:capstone1/screens/search/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchLoadingState());

  Future<void> getRecipes() async {
    emit(SearchLoadingState());
    //--Take all items from another list and add them to this list---------
    try {
      final data = await RecipeRepo().loadRecipes();
      final List<SingleRecipeModel> all = [];
      all.addAll(data.featuredRecipes);
      all.addAll(data.popularMeals);
      all.addAll(data.recommendedRecipes);

      emit(SearchLoadedState(allRecipes: all, listAfterSearch: all));
    } catch (e) {
      emit(SearchErrorStare(message: "something went wrong"));
    }
  }

  void search(String value) {
    //------ stop the function--------
    // return Iterable  where
    if (state is! SearchLoadedState) return;
    final currentState = state as SearchLoadedState;
    final results = currentState.allRecipes.where((recipe) {
      final title = recipe.title.toLowerCase();
      final input = value.toLowerCase();
      return title.contains(input);
    }).toList();

    emit(
      SearchLoadedState(
        allRecipes: currentState.allRecipes,
        listAfterSearch: results,
      ),
    );
  }
}
