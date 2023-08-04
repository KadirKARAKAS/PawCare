import 'package:flutter/material.dart';
import 'package:paw_care/AddVaccination/Widget/vaccination_textfield_adddatabase_widget.dart';
import 'package:paw_care/topbar_widget_backbutton.dart';

class VaccinationHomePage extends StatefulWidget {
  const VaccinationHomePage({super.key});

  @override
  State<VaccinationHomePage> createState() => _VaccinationHomePageState();
}

class _VaccinationHomePageState extends State<VaccinationHomePage> {
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
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: TopBarWidgetBackButton(titleText: "Vaccination Add"),
              ),
              SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: VaccinationTextFieldAdddataBaseWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
