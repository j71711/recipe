import 'package:capstone1/routes/route_key.dart';
import 'package:capstone1/screens/favorites/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final List<Map<String, dynamic>> profileOptions = [
    {"icon": Icons.favorite_border, "title": "Favorites"},
    {"icon": Icons.logout, "title": "Logout"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 246),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 236, 236, 246),
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 10),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Color.fromARGB(
                      255,
                      0,
                      26,
                      109,
                    ).withAlpha(25),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color.fromARGB(255, 0, 26, 109),
                    ),
                  ),
                  Gap(12),
                  Text(
                    "Jalnar Alharthi",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 26, 109),
                    ),
                  ),
                  Gap(6),
                  Text(
                    "jalnar@gmail.com",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 0, 26, 109),
                    ),
                  ),
                ],
              )
            ),
            Gap(20),
            Expanded(
              child: ListView.separated(
                itemCount: profileOptions.length,
                separatorBuilder: (context, index) => Gap( 12),
                itemBuilder: (context, index) {
                  final item = profileOptions[index];

                  return InkWell(
                    onTap: () {
                      if (item["title"] == "Favorites") {
                        context.push(
                          RouteKey.favoritesScreen,
                          extra: context.read<FavoriteCubit>(),
                        );
                      } else if (item["title"] == "Logout") {
                        context.go(RouteKey.loginScreen);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(
                                255,
                                97,
                                134,
                                255,
                              ).withAlpha(25),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(
                              item["icon"],
                              color: Color.fromARGB(255, 0, 26, 109),
                            ),
                          ),
                          Gap(24),
                          Expanded(
                            child: Text(
                              item["title"],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 11, 8, 81),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
