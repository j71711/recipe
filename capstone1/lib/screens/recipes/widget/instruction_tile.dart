
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InstructionTile extends StatelessWidget {
  const InstructionTile({super.key, required this.number, required this.instructions});

  final int number;
  final String instructions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration:  BoxDecoration(
              color: Color.fromARGB(184, 22, 3, 168),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "$number",
                style:  TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
           Gap(12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                instructions,
                style:  TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Color.fromARGB(255, 39, 28, 128),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
