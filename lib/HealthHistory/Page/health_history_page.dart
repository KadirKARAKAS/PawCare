import 'package:flutter/material.dart';
import 'package:paw_care/HealthHistory/Widget/health_pets_info_widget.dart';
import 'package:paw_care/HealthHistory/Widget/treatment_history_container_widget.dart';
import 'package:paw_care/HealthHistory/Widget/vaccination_history_container_widget.dart';
import 'package:paw_care/topbar_widget.dart';

class HealthHistoryPage extends StatefulWidget {
  const HealthHistoryPage({super.key});

  @override
  State<HealthHistoryPage> createState() => _HealthHistoryPageState();
}

class _HealthHistoryPageState extends State<HealthHistoryPage> {
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
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: TopBarWidget(
              titleText: "Health History",
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 5),
                HealthPetsInfoWidget(),
                SizedBox(height: 40),
                VaccinationHistoryContainerWidget(),
                SizedBox(height: 40),
                // TreatmentHistoryContainerWidget()
              ],
            ),
          ),
        ],
      ),
    ]));
  }
}
