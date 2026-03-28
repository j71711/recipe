import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:capstone1/model/recipe_home_model.dart';

class RecipeRepo {
  Future<RecipeHomeModel> loadRecipes() async {
    final jsonString =
        await rootBundle.loadString('assets/json/recipes.json');

    final Map<String, dynamic> data = jsonDecode(jsonString);

    return RecipeHomeModel.fromMap(data);
  }
}

   Future<RecipeHomeModel> loadRecipes() async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/recipes.json',
    );
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return RecipeHomeModel.fromMap(jsonData);
  }
