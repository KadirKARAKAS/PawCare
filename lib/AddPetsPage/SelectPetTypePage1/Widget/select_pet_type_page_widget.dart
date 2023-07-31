import 'package:flutter/material.dart';
import 'package:paw_care/AddPetsPage/DetailPetPage2/Page/detail_pet_page.dart';
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
            catContainer(context),
            SizedBox(width: 30),
            dogContainer(context),
          ],
        ),
      ],
    );
  }

  Widget catContainer(BuildContext context) {
    return InkWell(
      onTap: () {
        petsType = "Cat's";
        petsTypeIconBool = true;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailPetPage(),
            ));
      },
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
            color: const Color(0xffBFFCFF),
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 3), color: Colors.black26, blurRadius: 2)
            ]),
        child: const Hero(
            tag: "catHero", child: Image(image: AssetImage("assets/cat.png"))),
      ),
    );
  }

  Widget dogContainer(BuildContext context) {
    return InkWell(
      onTap: () {
        petsType = "Dog's";
        petsTypeIconBool = false;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailPetPage(),
            ));
      },
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
            color: const Color(0xffBFFCFF),
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 3), color: Colors.black26, blurRadius: 2)
            ]),
        child: const Hero(
          tag: "dogHero",
          child: Image(
            image: AssetImage("assets/dog.png"),
          ),
        ),
      ),
    );
  }
}
