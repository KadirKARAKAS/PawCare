import 'package:flutter/material.dart';
import 'package:paw_care/Utils/constant.dart';

class HealthHistoyPagePetsInfoWidget extends StatelessWidget {
  const HealthHistoyPagePetsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(999)),
            child: Image(
              image: NetworkImage(getdataList[selectedIndex]["PetsPhotoURL"]),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
