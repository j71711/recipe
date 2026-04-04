import 'package:capstone1/screens/bottom_navigation_bar/bloc/bottom_nav_bloc.dart';
import 'package:capstone1/screens/bottom_navigation_bar/widget/nav_widget.dart';
import 'package:capstone1/screens/category/category.dart';
import 'package:capstone1/screens/favorites/cubit/favorite_cubit.dart';
import 'package:capstone1/screens/home/home_screen.dart';
import 'package:capstone1/screens/profile/profile_screen.dart';
import 'package:capstone1/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomNavScreen extends HookWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavScreenController = usePageController();

    final screens = [
      HomeScreen(),
      CategoryScreen(),
      SearchScreen(),
      ProfileScreen(),
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBloc(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(),
        ),
      ],
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          int currentPage = 0;

          if (state is CurrentIndexState) {
            currentPage = state.currentIndex;
          }

          return Scaffold(
            extendBody: true,
            body: PageView(
              controller: bottomNavScreenController,
              onPageChanged: (index) {
                context.read<BottomNavBloc>().add(ChangePageEvent(index));
              },
              children: screens,
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(220),
                  borderRadius: BorderRadius.circular(40),                 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavItemWidget(
                      pageController: bottomNavScreenController,
                      icon: Icons.home_outlined,
                      label: "Home",
                      index: 0,
                      currentIndex: currentPage,
                      onTap: () {
                        context.read<BottomNavBloc>().add(ChangePageEvent(0));
                        bottomNavScreenController.animateToPage(
                          0,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    NavItemWidget(
                      pageController: bottomNavScreenController,
                      icon: Icons.grid_view_rounded,
                      label: "Category",
                      index: 1,
                      currentIndex: currentPage,
                      onTap: () {
                        context.read<BottomNavBloc>().add(ChangePageEvent(1));
                        bottomNavScreenController.animateToPage(
                          1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    NavItemWidget(
                      pageController: bottomNavScreenController,
                      icon: Icons.search,
                      label: "Search",
                      index: 2,
                      currentIndex: currentPage,
                      onTap: () {
                        context.read<BottomNavBloc>().add(ChangePageEvent(2));
                        bottomNavScreenController.animateToPage(
                          2,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    NavItemWidget(
                      pageController: bottomNavScreenController,
                      icon: Icons.person_outline,
                      label: "Profile",
                      index: 3,
                      currentIndex: currentPage,
                      onTap: () {
                        context.read<BottomNavBloc>().add(ChangePageEvent(3));
                        bottomNavScreenController.animateToPage(
                          3,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}