import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paw_care/Utils/constant.dart';

class HealthPetsInfoWidget extends StatelessWidget {
  const HealthPetsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: SizedBox(
              width: 115,
              height: 115,
              child: CachedNetworkImage(
                imageUrl: getdataList[selectedIndex]["PetsPhotoURL"],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [petsDetailContainer(size), petsDetailText()],
            ),
          ),
        ],
      ),
    );
  }

  Container petsDetailContainer(Size size) {
    return Container(
      width: size.width / 2,
      height: 80,
      decoration: BoxDecoration(
          color: const Color(0xffBFFCFF),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
                blurRadius: 3, color: Colors.black26, offset: Offset(-2, 2))
          ]),
    );
  }

  Padding petsDetailText() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name: ${getdataList[selectedIndex]["PetsName"]}",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              textAlign: TextAlign.center,
              softWrap: true),
          Text("Age: ${getdataList[selectedIndex]["PetsAge"]}",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              textAlign: TextAlign.center,
              softWrap: true),
        ],
      ),
    );
  }
}