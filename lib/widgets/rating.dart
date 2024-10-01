import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, required this.value, this.onClick});

  final double value;
  final Function(int)? onClick;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (var i = 0; i < 5; i++)
        GestureDetector(
          onTap: () {
            onClick?.call(i+1);
          },
          child: Icon(
            (value > i + 0.5) ? Icons.star : Icons.star_border,
            color: (onClick == null) ? Colors.black : Colors.deepPurple,
          ),
        ),
    ]);
  }
}
