import 'package:flutter/material.dart';

Widget sectionTitle(String title) {
  
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 46, 43, 95),
            ),
          ),
        ),
        Text(
          "See all",
          style: TextStyle(
            color: Color.fromARGB(255, 123, 97, 255),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
