import 'package:flutter/material.dart';

class TopBarWidgetBackButton extends StatelessWidget {
  const TopBarWidgetBackButton({super.key, required this.titleText});
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            titleText,
            style: const TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black, blurRadius: 1.5)]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 33,
              ),
            ),
          ),
        )
      ],
    );
  }
}
