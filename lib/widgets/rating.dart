import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, required this.value, this.color = Colors.black87, this.onStarClicked});

  final double value;
  final Color color;
  final Function(int)? onStarClicked;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 5; i++)
          GestureDetector(
            onTap: () {
              onStarClicked?.call(i+1);
            },
            child: Icon(
              (value > i + 0.5) ? Icons.star : Icons.star_border,
              color: color,
            ),
          ),
      ],
    );
  }
}
