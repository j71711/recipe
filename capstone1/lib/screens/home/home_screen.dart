import 'package:capstone1/model/all_recipe_model.dart';
import 'package:capstone1/repo/recipe_repo.dart';
import 'package:capstone1/routes/route_key.dart';
import 'package:capstone1/screens/favorites/cubit/favorite_cubit.dart';
import 'package:capstone1/screens/home/widget/see_all_widget.dart';
import 'package:capstone1/screens/home/widget/display_recipe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 246),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 236, 246),
        centerTitle: false,
        title: Text(
          "welcome",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 9, 1, 69),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: FutureBuilder<AllRecipeModel>(
        future: RecipeRepo().loadRecipes(),
        builder: (context, result) {
          if (result.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (result.hasError) {
            return Center(child: Text(result.error.toString()));
          }

          if (!result.hasData) {
            return Center(child: Text("No recipes found"));
          }

          final recipes = result.data!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What would you like to cook today?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 110, 106, 141),
                  ),
                ),
                Gap(16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 242, 251),
                    borderRadius: BorderRadius.circular(18),
                  ),

                  //-------------search --------------------------
                  child: InkWell(
                    onTap: () {
                      context.push(RouteKey.searchScreen);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search),

                          Gap(10),
                          Text("Search recipes"),
                        ],
                      ),
                    ),
                  ),
                ),

                Gap(24),
                //-------------Featured Recipes --------------------------
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 100),
                    children: [
                      seeAllWidget("Featured Recipes", () {
                        context.push(
                          RouteKey.seeAllScreen,
                          extra: {
                            'title': "Featured Recipes",
                            'recipes': recipes.featuredRecipes,
                            'favoriteCubit': context.read<FavoriteCubit>(),
                          },
                        );
                      }),
                      Gap(12),

                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recipes.featuredRecipes.length,
                          itemBuilder: (context, index) {
                            final recipe = recipes.featuredRecipes[index];

                            return SizedBox(
                              width: 170,
                              child: DisplayRecipeCard(
                                recipe: recipe,
                                onTap: () {
                                  context.push(
                                    RouteKey.recipeDetailsScreen,
                                    extra: recipe,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),

                      Gap(20),
                      //-------------"Popular Meals  --------------------------
                      seeAllWidget("Popular Meals", () {
                        context.push(
                          RouteKey.seeAllScreen,
                          extra: {
                            'title': "Popular Meals",
                            'recipes': recipes.popularMeals,
                            'favoriteCubit': context.read<FavoriteCubit>(),
                          },
                        );
                      }),
                      Gap(12),

                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recipes.popularMeals.length,
                          itemBuilder: (context, index) {
                            final recipe = recipes.popularMeals[index];

                            return SizedBox(
                              width: 170,
                              child: DisplayRecipeCard(
                                recipe: recipe,
                                onTap: () {
                                  context.push(
                                    RouteKey.recipeDetailsScreen,
                                    extra: recipe,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),

                      Gap(20),
                      //------------------ Recommended Recipes ------------------
                      seeAllWidget("Recommended Recipes", () {
                        context.push(
                          RouteKey.seeAllScreen,
                          extra: {
                            'title': "Recommended Recipes",
                            'recipes': recipes.recommendedRecipes,
                            'favoriteCubit': context.read<FavoriteCubit>(),
                          },
                        );
                      }),
                      Gap(12),

                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recipes.recommendedRecipes.length,
                          itemBuilder: (context, index) {
                            final recipe = recipes.recommendedRecipes[index];

                            return SizedBox(
                              width: 170,
                              child: DisplayRecipeCard(
                                recipe: recipe,
                                onTap: () {
                                  context.push(
                                    RouteKey.recipeDetailsScreen,
                                    extra: recipe,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
