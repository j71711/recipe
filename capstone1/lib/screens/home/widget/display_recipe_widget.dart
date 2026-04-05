import 'package:capstone1/model/single_recipe_model.dart';
import 'package:capstone1/screens/favorites/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DisplayRecipeCard extends StatelessWidget {
  final SingleRecipeModel recipe;
  final VoidCallback onTap;

  const DisplayRecipeCard({
    super.key,
    required this.recipe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final favorites = state is SuccessFavoriteState
            ? state.favorites
            : <SingleRecipeModel>[];

        final isFav = favorites.any((item) => item.id == recipe.id);

        return InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12, right: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        recipe.image,
                        width: double.infinity,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: InkWell(
                        onTap: () {
                          context.read<FavoriteCubit>().toggleFavorite(recipe);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav
                                ? Colors.red
                                : const Color.fromARGB(255, 17, 5, 109),
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                 Gap(6),
                Text(
                  recipe.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 8, 2, 89),
                  ),
                ),
                const Gap(4),
                Text(
                  recipe.category,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 8, 2, 89),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
