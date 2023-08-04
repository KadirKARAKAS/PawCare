import 'package:flutter/material.dart';

class TopBarWidgetBackButton extends StatelessWidget {
  const TopBarWidgetBackButton({super.key, required this.titleText});
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        titleText,
        style: const TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(color: Colors.black, blurRadius: 1.5)]),
      ),
    );
  }
}
