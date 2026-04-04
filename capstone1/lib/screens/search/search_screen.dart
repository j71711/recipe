import 'package:capstone1/routes/route_key.dart';
import 'package:capstone1/screens/search/cubit/search_cubit.dart';
import 'package:capstone1/screens/search/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..getRecipes(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 236, 236, 246),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 236, 236, 246),
              title: Text(
                "Search Recipes",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 26, 109),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //--------------- search bar---------
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    onChanged: (value) {
                      context.read<SearchCubit>().search(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search recipes...",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Color.fromARGB(255, 244, 240, 253),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is SearchErrorStare) {
                        return Center(child: Text(state.message));
                      }

                      if (state is SearchLoadedState) {
                        if (state.listAfterSearch.isEmpty) {
                          return Center(child: Text("No results found"));
                        }
                        //--------------- list of all recipes---------
                        return ListView.builder(
                          padding: EdgeInsets.all(16),
                          itemCount: state.listAfterSearch.length,
                          itemBuilder: (context, index) {
                            final recipe = state.listAfterSearch[index];

                            return InkWell(
                              onTap: () {
                                context.push(
                                  RouteKey.recipeDetailsScreen,
                                  extra: recipe,
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 12),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Image.asset(
                                        recipe.image,
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Gap(24),
                                    Expanded(
                                      child: Text(
                                        recipe.title,
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            0,
                                            26,
                                            109,
                                          ),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return SizedBox();
                    },
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
