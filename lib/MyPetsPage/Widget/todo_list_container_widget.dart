import 'package:flutter/material.dart';

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
    return Container(
      width: size.width,
      height: 270,
      decoration: BoxDecoration(
          color: const Color(0xffBFFCFF),
          borderRadius: BorderRadius.circular(34),
          boxShadow: const [
            BoxShadow(
                blurRadius: 3, color: Colors.black26, offset: Offset(-2, 2))
          ]),
    );
  }
}
