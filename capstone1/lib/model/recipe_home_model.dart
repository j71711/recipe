import 'package:capstone1/model/%20recipe_item_model.dart';

class RecipeHomeModel {
  final List<RecipeItemModel> featuredRecipes;
  final List<RecipeItemModel> popularMeals;
  final List<RecipeItemModel> recommendedRecipes;

  RecipeHomeModel({
    required this.featuredRecipes,
    required this.popularMeals,
    required this.recommendedRecipes,
  });

  factory RecipeHomeModel.fromMap(Map<String, dynamic> map) {
    return RecipeHomeModel(
      featuredRecipes: ((map['featured_recipes'] ?? []) as List)
          .map((e) => RecipeItemModel.fromMap(e))
          .toList(),
      popularMeals: ((map['popular_meals'] ?? []) as List)
          .map((e) => RecipeItemModel.fromMap(e))
          .toList(),
      recommendedRecipes: ((map['recommended_recipes'] ?? []) as List)
          .map((e) => RecipeItemModel.fromMap(e))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'featured_recipes': featuredRecipes.map((e) => e.toMap()).toList(),
      'popular_meals': popularMeals.map((e) => e.toMap()).toList(),
      'recommended_recipes':
          recommendedRecipes.map((e) => e.toMap()).toList(),
    };
  }
}

