import 'package:capstone1/model/all_recipe_model.dart';
import 'package:capstone1/repo/recipe_repo.dart';
import 'package:capstone1/routes/route_key.dart';
import 'package:capstone1/screens/favorites/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 246),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 236, 246),

        centerTitle: true,
        title: Text(
          "Categories",
          style: TextStyle(
            color: Color.fromARGB(255, 47, 44, 97),
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
            return Center(child: Text("No data"));
          }

          final data = result.data!;

          final allRecipes = [
            ...data.featuredRecipes,
            ...data.popularMeals,
            ...data.recommendedRecipes,
          ];

          final categories = allRecipes.map((e) => e.category).toSet().toList();

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: categories.length,
            separatorBuilder: (context, index) => Gap( 14),
            itemBuilder: (context, index) {
              final category = categories[index];

              final filtered = allRecipes
                  .where((e) => (e.category) == category)
                  .toList();

              return InkWell(
                borderRadius: BorderRadius.circular(22),
                onTap: () {
                  context.push(
                    RouteKey.seeAllScreen,
                    extra: {
                      'title': category,
                      'recipes': filtered,
                      'favoriteCubit': context.read<FavoriteCubit>(),
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(12),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 23, 19, 99),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Color.fromARGB(255, 17, 14, 87),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
