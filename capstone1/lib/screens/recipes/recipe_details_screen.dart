import 'package:capstone1/model/single_recipe_model.dart';
import 'package:capstone1/screens/recipes/widget/Instruction_tile.dart';
import 'package:capstone1/screens/recipes/widget/recipeInfo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key, required this.recipe});

  final SingleRecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    final String title = recipe.title;
    final String image = recipe.image;
    final String category = recipe.category;
    final String cookTime = recipe.cookTime;
    final String difficulty = recipe.difficulty;
    final List<String> instructions = recipe.instructions;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 246),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 236, 246),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            color: Color.fromARGB(255, 29, 23, 115),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(255, 32, 25, 125),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(18),
              Text(
                title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 20, 16, 89),
                ),
              ),
              Gap(14),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  RecipeInfo(text: category),
                  RecipeInfo(text: cookTime),
                  RecipeInfo(text: difficulty),
                ],
              ),
              Gap(24),
              Text(
                "Instructions",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 20, 16, 89),
                ),
              ),
              Gap(14),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: instructions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InstructionTile(
                      number: index + 1,
                      instructions: instructions[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
