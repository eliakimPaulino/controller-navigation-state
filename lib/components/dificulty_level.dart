import 'package:flutter/material.dart';

class Dificulty extends StatelessWidget {
  const Dificulty({Key? key, required this.dificultyLevel}) : super(key: key);
  final int dificultyLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            color: (dificultyLevel >= 1)
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary),
        Icon(Icons.star,
            color: (dificultyLevel >= 2)
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary),
        Icon(Icons.star,
            color: (dificultyLevel >= 3)
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary),
        Icon(Icons.star,
            color: (dificultyLevel >= 4)
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary),
        Icon(Icons.star,
            color: (dificultyLevel >= 5)
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary),
      ],
    );
  }
}