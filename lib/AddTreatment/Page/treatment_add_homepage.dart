import 'package:flutter/material.dart';
import 'package:paw_care/topbar_widget.dart';

class TreatementAddHomePage extends StatefulWidget {
  const TreatementAddHomePage({super.key});

  @override
  State<TreatementAddHomePage> createState() => _TreatementAddHomePageState();
}

class _TreatementAddHomePageState extends State<TreatementAddHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/BackGroundPage.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Column(
            children: [
              SizedBox(height: 30),
              TopBarWidget(titleText: "Treatment Add"),
            ],
          )
        ],
      ),
    );
  }
}
