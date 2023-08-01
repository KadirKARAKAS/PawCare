import 'package:flutter/material.dart';
import 'package:paw_care/Utils/constant.dart';

class VaccinationListContainer extends StatefulWidget {
  const VaccinationListContainer({super.key});

  @override
  State<VaccinationListContainer> createState() =>
      _VaccinationListContainerState();
}

class _VaccinationListContainerState extends State<VaccinationListContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: 270,
          decoration: BoxDecoration(
              color: const Color(0xffBFFCFF),
              borderRadius: BorderRadius.circular(34),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 3, color: Colors.black26, offset: Offset(-2, 2))
              ]),
        ),
        Container(
            width: size.width,
            color: Colors.red,
            child: Align(
                alignment: Alignment.centerRight,
                child: vaccinationContainerRow())),
      ],
    );
  }

  Widget vaccinationContainerRow() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: getdataList.length,
      itemBuilder: (context, index) {
        return vaccinationPhotoContainer(index);
      },
    );
  }

  Widget vaccinationPhotoContainer(int index) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(getdataList[index]["PetsPhotoURL"]),
                  fit: BoxFit.cover)),
        ),
      ],
    );
  }
}
