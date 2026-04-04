
import 'package:flutter/material.dart';

class RecipeInfo extends StatelessWidget {
  const RecipeInfo({super.key, required this.text});

  final String text;
///-------------- 3 icons pasta easy 20min----------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        text,
        style:  TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color:  Color.fromARGB(255, 20, 16, 89),
        ),
      ),
    );
  }
}