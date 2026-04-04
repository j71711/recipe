import 'package:capstone1/model/single_recipe_model.dart';

class AllRecipeModel {
  final List<SingleRecipeModel> featuredRecipes;
  final List<SingleRecipeModel> popularMeals;
  final List<SingleRecipeModel> recommendedRecipes;

  AllRecipeModel({
    required this.featuredRecipes,
    required this.popularMeals,
    required this.recommendedRecipes,
  });
// //Iterable
  factory AllRecipeModel.fromMap(Map<String, dynamic> map) {
    return AllRecipeModel(
      featuredRecipes: ((map['featured_recipes'] ) as List)
          .map((e) => SingleRecipeModel.singleJsonMap(e))
          .toList(),
      popularMeals: ((map['popular_meals'] ) as List)
          .map((e) => SingleRecipeModel.singleJsonMap(e))
          .toList(),
      recommendedRecipes: ((map['recommended_recipes'] ) as List)
          .map((e) => SingleRecipeModel.singleJsonMap(e))
          .toList(),
    );
  }

}