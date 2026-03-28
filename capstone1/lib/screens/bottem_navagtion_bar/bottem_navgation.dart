
import 'package:capstone1/screens/bottem_navagtion_bar/bloc/bottom_nav_bloc.dart';
import 'package:capstone1/screens/bottem_navagtion_bar/widget/nav_widget.dart';
import 'package:capstone1/screens/category_screen/Category_screen.dart';
import 'package:capstone1/screens/home_screen/home_screen.dart';
import 'package:capstone1/screens/proflie/profile_screen.dart';
import 'package:capstone1/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomNavScreen extends HookWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();

    final screens = [
      HomeScreen(),
      CategoryScreen(),
      SearchScreen(),
      ProfileScreen(),
    ];

    return BlocProvider(
      create: (_) => BottomNavBloc(),
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          int currentIndex = 0;

          if (state is CurrentIndexState) {
            currentIndex = state.currentIndex;
          }

          return Scaffold(
            extendBody: true,
            body: PageView(
              controller: pageController,
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
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 12,
                      offset: Offset(0, 4),
                      color: Color.fromARGB(40, 0, 0, 0),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NavItemWidget(
                      pageController: pageController,
                      icon: Icons.home_outlined,
                      label: "Home",
                      index: 0,
                      currentIndex: currentIndex,
                      onTap: () {
                        context.read<BottomNavBloc>().add(ChangePageEvent(0));
                        pageController.animateToPage(
                          0,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    NavItemWidget(
                      pageController: pageController,
                      icon: Icons.grid_view_rounded,
                      label: "Category",
                      index: 1,
                      currentIndex: currentIndex,
                      onTap: () {
                        context.read<BottomNavBloc>().add(ChangePageEvent(1));
                        pageController.animateToPage(
                          1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    NavItemWidget(
                      pageController: pageController,
                      icon: Icons.search,
                      label: "Search",
                      index: 2,
                      currentIndex: currentIndex,
                      onTap: () {
                        context.read<BottomNavBloc>().add(ChangePageEvent(1));
                        pageController.animateToPage(
                          1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                    NavItemWidget(
                      pageController: pageController,
                      icon: Icons.person_outline,
                      label: "Profile",
                      index: 3,
                      currentIndex: currentIndex,
                      onTap: () {
                        context.read<BottomNavBloc>().add(ChangePageEvent(3));
                        pageController.animateToPage(
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
