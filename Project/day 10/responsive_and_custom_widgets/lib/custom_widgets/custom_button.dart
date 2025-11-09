import 'package:flutter/material.dart';

abstract class MyCustomButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;
  const MyCustomButton({
    required this.label,
    required this.color,
    required this.onTap,
    super.key,
  });

  @override
  Widget built(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: () => onTap(),
      child: Text(label),
    );
  }
}