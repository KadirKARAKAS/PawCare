import 'package:flutter/material.dart';
import '../Widget/detail_pet_adddata_widget.dart';

class DetailPetPage extends StatefulWidget {
  const DetailPetPage({super.key});

  @override
  State<DetailPetPage> createState() => _DetailPetPageState();
}

class _DetailPetPageState extends State<DetailPetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/BackGroundPage.png"),
                  fit: BoxFit.cover)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              DetailPetAdddataWidget(),
            ],
          ),
        )
      ],
    ));
  }
}
