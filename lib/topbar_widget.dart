import 'package:flutter/material.dart';
import 'package:paw_care/Utils/constant.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key, required this.titleText});
  final String titleText;
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
                child: iconVisiable
                    ? const Icon(
                        Icons.arrow_back,
                        size: 30,
                      )
                    : const SizedBox(),
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
                  shadows: [Shadow(color: Colors.black, blurRadius: 1.5)]),
            ),
          ],
        )
      ],
    );
  }
}
