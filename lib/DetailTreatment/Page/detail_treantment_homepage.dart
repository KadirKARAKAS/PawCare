import 'package:flutter/material.dart';
import 'package:paw_care/DetailTreatment/Widget/detail_treantment_mainwidget_widget.dart';
import 'package:paw_care/topbar_widget.dart';

class DetailTreantmentHomePage extends StatefulWidget {
  const DetailTreantmentHomePage({super.key});

  @override
  State<DetailTreantmentHomePage> createState() =>
      _DetailTreantmentHomePageState();
}

class _DetailTreantmentHomePageState extends State<DetailTreantmentHomePage> {
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
            child: DetailTreantmentMainWidget(),
          ),
        ],
      )
    ]));
  }
}
