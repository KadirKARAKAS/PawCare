import 'package:flutter/material.dart';
import 'package:paw_care/AddVaccination/Page/vaccination_homepage.dart';
import 'package:paw_care/Utils/constant.dart';

class VaccinationHistoryContainerWidget extends StatelessWidget {
  const VaccinationHistoryContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
        valueListenable: valueNotifierX,
        builder: (context, value, child) {
          return Stack(
            children: [
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
              Padding(
                padding: const EdgeInsets.only(top: 17, left: 20, right: 17),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Vaccination History",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const VaccinationHomePage()));
                          },
                          child: const Image(
                            image: AssetImage("assets/plus.png"),
                            width: 20,
                            height: 20,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: petsVaccinationList.length,
                        itemBuilder: (context, index) {
                          return vaccinationHistoryContainer(context, index);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  Widget vaccinationHistoryContainer(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    String vaccinationInformation =
        petsVaccinationList[index]["VaccinationInformation"] ?? '';
    String vaccinationDate =
        petsVaccinationList[index]["VaccinationDate"] ?? '';

    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              width: size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xffE0FEFF),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 1,
                        color: Colors.black26,
                        offset: Offset(-1, 1))
                  ]),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Row(
              children: [
                const Icon(Icons.abc),
                const SizedBox(width: 15),
                Text(vaccinationInformation),
                const SizedBox(width: 130),
                Text(vaccinationDate),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_right,
                  size: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
