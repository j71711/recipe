import 'package:flutter/material.dart';

Widget seeAllWidget(String title,VoidCallback onTap) {
  
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:Color.fromARGB(255, 46, 43, 95),
            ),
          ),
        ),
        InkWell(
        onTap: onTap,
        child: Text(
          "See all",
          style: TextStyle(
            color:Color.fromARGB(255, 46, 43, 95),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}