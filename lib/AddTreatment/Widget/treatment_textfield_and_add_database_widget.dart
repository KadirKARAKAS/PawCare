import 'package:flutter/material.dart';

class TreatmentTextFieldAndAddDataBaseWidget extends StatelessWidget {
  TreatmentTextFieldAndAddDataBaseWidget({super.key});

  @override
  final TextEditingController nameVaccination = TextEditingController();
  final TextEditingController dateVaccination = TextEditingController();
  final TextEditingController clinicVaccination = TextEditingController();
  final TextEditingController doctorVaccination = TextEditingController();
  Widget build(BuildContext context) {
    return Column(
      children: [
        textFieldContainerTreatment(context, "Type of treatment applied",
            "Foreign body swallowing surgery", nameVaccination),
        textFieldContainerTreatment(context, "On which date it was made",
            "10/09/2021", dateVaccination),
        textFieldContainerTreatment(
            context,
            "Name of the clinic where the treatment was performed",
            "Animal Health Center",
            clinicVaccination),
        textFieldContainerTreatment(context, "Name of the treating doctor",
            "Jack Pate", doctorVaccination),
      ],
    );
  }

  Widget textFieldContainerTreatment(
    BuildContext context,
    String containerTopText,
    String containerText,
    TextEditingController controllerTreatemt,
  ) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(containerTopText,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
                textAlign: TextAlign.start,
                softWrap: true)),
      ),
      const SizedBox(height: 3),
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffE0FEFF),
              border: Border.all(width: 0.4, color: const Color(0xff979797))),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              keyboardType: TextInputType.name,
              controller: controllerTreatemt,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: containerText,
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff979797))),
            ),
          ),
        ),
      )
    ]);
  }
}
