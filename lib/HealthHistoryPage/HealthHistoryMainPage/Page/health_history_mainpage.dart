import 'package:flutter/material.dart';
import 'package:paw_care/HealthHistoryPage/HealthHistoryMainPage/Widget/health_history_page_pets_info_widget.dart';
import 'package:paw_care/topbar_widget.dart';

class HealthHistoryMainPage extends StatefulWidget {
  const HealthHistoryMainPage({super.key});

  @override
  State<HealthHistoryMainPage> createState() => _HealthHistoryMainPageState();
}

class _HealthHistoryMainPageState extends State<HealthHistoryMainPage> {
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
      const Padding(
        padding: EdgeInsets.only(top: 30),
        child: TopBarWidget(titleText: "Health History"),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            HealthHistoyPagePetsInfoWidget(),
          ],
        ),
      ),
    ]));
  }
}
