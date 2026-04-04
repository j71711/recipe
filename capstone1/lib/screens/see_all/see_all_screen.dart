import 'package:capstone1/model/single_recipe_model.dart';
import 'package:capstone1/routes/route_key.dart';
import 'package:capstone1/screens/category/bloc/category_bloc.dart';

import 'package:capstone1/screens/home/widget/display_recipe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key, required this.title, required this.recipes});

  final String title;
  final List<SingleRecipeModel> recipes;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 236, 246),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 236, 236, 246),
          title: Text(title),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon:  Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryInitial) {
              return  Center(child: CircularProgressIndicator());
            }

            if (state is CategoryLoaded) {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.recipes.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final recipe = state.recipes[index];

                  return DisplayRecipeCard(
                    recipe: recipe,
                    onTap: () {
                      context.push(RouteKey.recipeDetailsScreen, extra: recipe);
                    },
                  );
                },
              );
            }

            return const Center(child: Text("Something went wrong"));
          },
        ),
      
    );
  }
}
