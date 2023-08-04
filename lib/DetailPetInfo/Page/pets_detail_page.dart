import 'package:flutter/material.dart';
import 'package:paw_care/DetailPetInfo/Widget/pets_detail_page_widget.dart';
import 'package:paw_care/topbar_widget.dart';

class PetsDetailPage extends StatefulWidget {
  const PetsDetailPage({super.key});

  @override
  State<PetsDetailPage> createState() => _PetsDetailPageState();
}

class _PetsDetailPageState extends State<PetsDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: [
      Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/BackGroundPage.png'),
                fit: BoxFit.cover)),
      ),
      const Column(
        children: [
          SizedBox(height: 30),
          TopBarWidget(titleText: "Treatment Details"),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PetsDetailPageWidget(),
          ),
        ],
      )
    ]));
  }
}
