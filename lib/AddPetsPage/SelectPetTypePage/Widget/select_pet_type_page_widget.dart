import 'package:flutter/material.dart';
import 'package:paw_care/Utils/constant.dart';

class SelectPetTypePageWidget extends StatelessWidget {
  const SelectPetTypePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 300),
        Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(
              color: const Color(0xffBFFCFF),
              borderRadius: BorderRadius.circular(19),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 2), color: Colors.black38, blurRadius: 4)
              ]),
          child: const Center(
            child: Text(
              "Choose your pet",
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff979797),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catContainer(),
            SizedBox(width: 30),
            dogContainer(),
          ],
        ),
      ],
    );
  }

  Widget catContainer() {
    return InkWell(
      onTap: () {
        petsType = "Cat";
        print(petsType);
      },
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
            color: const Color(0xffBFFCFF),
            borderRadius: BorderRadius.circular(30),
            image: const DecorationImage(image: AssetImage("assets/cat.png")),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 3), color: Colors.black26, blurRadius: 2)
            ]),
      ),
    );
  }

  Widget dogContainer() {
    return InkWell(
      onTap: () {
        petsType = "Dog";
        print(petsType);
      },
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
            color: const Color(0xffBFFCFF),
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                image: AssetImage("assets/dog.png"), fit: BoxFit.cover),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 3), color: Colors.black26, blurRadius: 2)
            ]),
      ),
    );
  }
}
