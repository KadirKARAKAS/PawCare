import 'package:flutter/material.dart';
import 'package:paw_care/Utils/constant.dart';

class VaccinationHistoryContainerWidget extends StatelessWidget {
  const VaccinationHistoryContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
        valueListenable: valueNotifierX,
        builder: (context, value, child) {
          return Stack(children: [
            Container(
              width: size.width,
              height: 250,
              decoration: BoxDecoration(
                  color: const Color(0xffBFFCFF),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 3,
                        color: Colors.black26,
                        offset: Offset(-2, 2))
                  ]),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 20),
                  child: vaccinationTitle(),
                ),
                const SizedBox(height: 10),
                vaccinationListContainer(context),
                vaccinationListContainer(context),
                vaccinationListContainer(context),
              ],
            ),
          ]);
        });
  }

  Row vaccinationTitle() {
    return Row(
      children: [
        Text(
          "Vaccination History",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(
                    image: AssetImage("assets/plus.png"), width: 20, height: 20)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget vaccinationListContainer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(
            height: 40,
            width: size.width,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/vaccination.png")),
                    const SizedBox(width: 10),
                    Text(getdataList[0]["PetsAge"]),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
