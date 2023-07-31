import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget(
      {super.key, required this.titleText, required this.appbarIcon});
  final String titleText;
  final IconData appbarIcon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  appbarIcon,
                  size: 30,
                ),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titleText,
              style: const TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black, blurRadius: 0)]),
            ),
          ],
        )
      ],
    );
  }
}
