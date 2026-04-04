import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NavItemWidget extends StatelessWidget {
  const NavItemWidget({
    super.key,
    required this.pageController,
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex, required Null Function() onTap,
  });

  final PageController pageController;
  final IconData icon;
  final String label;
  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        pageController.jumpToPage(index);
      },
      child: AnimatedContainer(
        duration:  Duration(milliseconds: 250),
        padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ?  Color.fromARGB(255, 0, 26, 109)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black54,
            ),
            if (isSelected) ...[
               Gap(6),
              Text(
                label,
                style:  TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
