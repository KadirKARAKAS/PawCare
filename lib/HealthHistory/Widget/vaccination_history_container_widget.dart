import 'package:flutter/material.dart';
import 'package:paw_care/AddVaccination/Page/vaccination_homepage.dart';
import 'package:paw_care/DetailVaccination/Page/vaccination_detail_page.dart';
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
                  padding: const EdgeInsets.only(top: 15, left: 20),
                  child: vaccinationTitle(context),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 190,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: petsVaccinationList.length + 1,
                    itemBuilder: (context, index) {
                      if (index == petsVaccinationList.length) {
                        return petsVaccinationList.isEmpty
                            ? Column(
                                children: [
                                  isEmptyContainer(context),
                                  const SizedBox(height: 5),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      "You can note down your pet's vaccinations and check when the next vaccination date is",
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox();
                      }
                      return vaccinationListContainer(context, index);
                    },
                  ),
                )
              ],
            ),
          ]);
        });
  }

  Row vaccinationTitle(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Vaccination History",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VaccinationHomePage(),
                        ));
                  },
                  child: const Image(
                      image: AssetImage("assets/plus.png"),
                      width: 20,
                      height: 20),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget vaccinationListContainer(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: 40,
            decoration: BoxDecoration(
                color: const Color(0xffE0FEFF),
                borderRadius: BorderRadius.circular(8),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  const BoxShadow(
                      blurRadius: 1,
                      color: Colors.black54,
                      offset: Offset(-2, 1))
                ]),
          ),
          SizedBox(
            height: 40,
            width: size.width,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("assets/vaccination.png"),
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(petsVaccinationList[index]["NameVaccination"]),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(petsVaccinationList[index]["DateVaccination"]),
                          InkWell(
                            onTap: () {
                              vaccinationSelectedIndex = index;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const VaccinationDetailPage(),
                                  ));
                            },
                            child: const Image(
                              image: AssetImage("assets/treepoint.png"),
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget isEmptyContainer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: 40,
            decoration: BoxDecoration(
                color: const Color(0xffE0FEFF),
                borderRadius: BorderRadius.circular(8),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  const BoxShadow(
                      blurRadius: 1,
                      color: Colors.black54,
                      offset: Offset(-2, 1))
                ]),
          ),
          SizedBox(
            height: 40,
            width: size.width,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("assets/vaccination.png"),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text("Vaccine name"),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Date of vaccination"),
                          Image(
                            image: AssetImage("assets/treepoint.png"),
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    )
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
