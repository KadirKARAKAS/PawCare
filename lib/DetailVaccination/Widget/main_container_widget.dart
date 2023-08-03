import 'package:flutter/material.dart';
import 'package:paw_care/Utils/constant.dart';

class MainContainerWidget extends StatefulWidget {
  const MainContainerWidget({super.key});

  @override
  State<MainContainerWidget> createState() => _MainContainerWidgetState();
}

class _MainContainerWidgetState extends State<MainContainerWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: size.width,
          height: 465,
          decoration: BoxDecoration(
              color: const Color(0xffBFFCFF),
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 3, color: Colors.black26, offset: Offset(-2, 2))
              ]),
        ),
        Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            detailInfoWidget(
              "Vaccination information",
              petsVaccinationList[vaccinationSelectedIndex]["NameVaccination"],
            ),
            detailInfoWidget(
              "Date of vaccination",
              petsVaccinationList[vaccinationSelectedIndex]["DateVaccination"],
            ),
            detailInfoWidget(
              "Name of the clinic",
              petsVaccinationList[vaccinationSelectedIndex]
                  ["ClinicVaccination"],
            ),
            detailInfoWidget(
              "Doctor name",
              petsVaccinationList[vaccinationSelectedIndex]
                  ["DoctorVaccination"],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 35,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffE0FEFF),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 3,
                            color: Colors.black26,
                            offset: Offset(-2, 2))
                      ]),
                  child: Center(
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Back",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ))),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget detailInfoWidget(String detailContainerTopText, String containerText) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 2),
                child: Text(detailContainerTopText,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                    textAlign: TextAlign.start,
                    softWrap: true),
              )),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  width: size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      color: const Color(0xffE0FEFF),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 3,
                            color: Colors.black26,
                            offset: Offset(-2, 2))
                      ]),
                ),
              ),
              SizedBox(
                height: 60,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(containerText),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
