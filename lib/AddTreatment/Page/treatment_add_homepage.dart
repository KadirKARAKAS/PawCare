import 'package:flutter/material.dart';
import 'package:paw_care/AddTreatment/Widget/treatment_textfield_and_add_database_widget.dart';
import 'package:paw_care/topbar_widget_backbutton.dart';

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
          SizedBox(
            height: size.height,
            child: const Column(
              children: [
                SizedBox(height: 30),
                TopBarWidgetBackButton(titleText: "Treatment Add"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      TreatmentTextFieldAndAddDataBaseWidget(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
