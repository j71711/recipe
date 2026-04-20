import 'package:capstone1/screens/favorites/cubit/favorite_cubit.dart';
import 'package:capstone1/model/single_recipe_model.dart';
import 'package:capstone1/routes/route_key.dart';
import 'package:capstone1/screens/home/widget/display_recipe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //!-------
     final cubit = context.read<FavoriteCubit>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 246),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 236, 246),
        centerTitle: true,
        title: Text(
          "Favorites",
          style: TextStyle(
            color: Color.fromARGB(255, 23, 18, 86),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
           // get FavoriteCubit instance
           
            final List<SingleRecipeModel> favorites = cubit.favorite;
            if (favorites.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/lottie/Empty.json',
                      width: 400,
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      "no favorites found",
                      style: TextStyle(
                        fontWeight: .bold,
                        fontSize: 20,
                        color: const Color.fromARGB(255, 1, 20, 93),
                      ),
                    ),
                  ],
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
              itemCount: favorites.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final recipe = favorites[index];

                return Column(
                  children: [
                    DisplayRecipeCard(
                      recipe: recipe,
                      onTap: () {
                        context.push(
                          RouteKey.recipeDetailsScreen,
                          extra: recipe,
                        );
                      },
                    ),
                     Gap(12),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
