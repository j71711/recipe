import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:capstone1/model/all_recipe_model.dart';

class RecipeRepo {
  Future<AllRecipeModel> loadRecipes() async {
    //  rootBundle.loadString gives access to your app files (assets)
    final String loadingData = await rootBundle.loadString(
      'assets/json/recipes.json',
    );
    final Map<String, dynamic> data = json.decode(loadingData);
    return AllRecipeModel.fromMap(data);
  }
}
