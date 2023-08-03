import 'package:flutter/material.dart';
import 'package:paw_care/DetailVaccination/Widget/main_container_widget.dart';
import 'package:paw_care/topbar_widget.dart';

class VaccinationDetailPage extends StatefulWidget {
  const VaccinationDetailPage({super.key});

  @override
  State<VaccinationDetailPage> createState() => _VaccinationDetailPageState();
}

class _VaccinationDetailPageState extends State<VaccinationDetailPage> {
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
          TopBarWidget(titleText: "Vaccine Details"),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: MainContainerWidget(),
          ),
        ],
      )
    ]));
  }
}
