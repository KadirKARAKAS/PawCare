import 'package:flutter/material.dart';

class TreatmentTextFieldAndAddDataBaseWidget extends StatelessWidget {
  const TreatmentTextFieldAndAddDataBaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/BackGroundPage.png'),
            fit: BoxFit.cover,
          ),
        ),
      )
    ]);
  }
}
