import 'package:flutter/material.dart';

class VaccinationHistoryContainerWidget extends StatelessWidget {
  const VaccinationHistoryContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    blurRadius: 3, color: Colors.black26, offset: Offset(-2, 2))
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      print("object");
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
              vaccinationHistoryContainer(context),
            ],
          ),
        )
      ],
    );
  }

  Widget vaccinationHistoryContainer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(
              color: const Color(0xffE0FEFF),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 3, color: Colors.black26, offset: Offset(-2, 2))
              ]),
        ),
        const Positioned(
          top: 12,
          left: 10,
          child: Row(
            children: [
              Icon(Icons.abc),
              SizedBox(width: 15),
              Text("Rabies"),
              SizedBox(
                width: 130,
              ),
              Text("23/07/2023"),
              SizedBox(width: 8),
              Image(image: AssetImage("assets/treepoint.png"))
            ],
          ),
        ),
      ],
    );
  }
}
