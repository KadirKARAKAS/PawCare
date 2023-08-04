import 'package:flutter/material.dart';
import 'package:paw_care/AddTreatment/Page/treatment_add_homepage.dart';
import 'package:paw_care/DetailTreatment/Page/detail_treantment_homepage.dart';
import 'package:paw_care/Utils/constant.dart';

class TreatmentHistoryContainerWidget extends StatelessWidget {
  const TreatmentHistoryContainerWidget({super.key});

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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: treatmentHistoryContainerTitle(context),
                  ),
                  SizedBox(
                    height: 190,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        itemCount: petsTreatmentList.length + 1,
                        itemBuilder: (context, index) {
                          if (index == petsTreatmentList.length) {
                            return petsTreatmentList.isEmpty
                                ? Column(
                                    children: [
                                      listisEmptyContainer(context),
                                      const SizedBox(height: 5),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          "You can add your pet's treatments here and keep notes",
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox();
                          }
                          return treatmentnListContainer(context, index);
                        }),
                  )
                ],
              ),
            ],
          );
        });
  }

  Row treatmentHistoryContainerTitle(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Treatment History",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TreatementAddHomePage(),
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

  Widget treatmentnListContainer(BuildContext context, int index) {
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
                      image: AssetImage("assets/treatment.png"),
                      width: 35,
                      height: 35,
                    ),
                    const SizedBox(width: 10),
                    Text(petsTreatmentList[index]["NameTreatment"]),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(petsTreatmentList[index]["DateTreatment"]),
                          InkWell(
                            onTap: () {
                              treatmentSelectedIndex = index;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DetailTreantmentHomePage(),
                                  ));
                            },
                            child: const Image(
                              image: AssetImage("assets/treepoint.png"),
                              width: 15,
                              height: 15,
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

  Widget listisEmptyContainer(BuildContext context) {
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
                      image: AssetImage("assets/treatment.png"),
                      width: 35,
                      height: 35,
                    ),
                    SizedBox(width: 10),
                    Text("Treatment name"),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Date of treatment"),
                          Image(
                            image: AssetImage("assets/treepoint.png"),
                            width: 15,
                            height: 15,
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
