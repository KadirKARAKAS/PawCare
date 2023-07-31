import 'package:flutter/material.dart';
import 'package:paw_care/Utils/constant.dart';
import 'package:paw_care/topbar_widget.dart';

class DetailPetAdddataWidget extends StatefulWidget {
  const DetailPetAdddataWidget({super.key});

  @override
  State<DetailPetAdddataWidget> createState() => _DetailPetAdddataWidgetState();
}

class _DetailPetAdddataWidgetState extends State<DetailPetAdddataWidget> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController petsNameController = TextEditingController();
    final TextEditingController petsAgeController = TextEditingController();
    final TextEditingController petsBreedController = TextEditingController();
    final TextEditingController petsGenderController = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Center(),
        const SizedBox(
          height: 50,
        ),
        const TopBarWidget(titleText: "Add Pet's"),
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            petsdetailcontainer(
                size, "name", petsNameController, TextInputType.text),
            const SizedBox(height: 10),
            petsdetailcontainer(
                size, "age", petsAgeController, TextInputType.number),
            const SizedBox(height: 10),
            petsdetailcontainer(
                size, "breed", petsBreedController, TextInputType.name),
            const SizedBox(height: 10),
            petsdetailcontainer(
                size, "gender", petsGenderController, TextInputType.name),
            const SizedBox(height: 55),
            petsImageContainerWidget(context),
            SizedBox(height: 50),
            petsAddButton(),
          ],
        ),
      ],
    );
  }

  Container petsdetailcontainer(Size size, String containerText,
      TextEditingController controllerr, TextInputType keyboard) {
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: const Color(0xffBFFCFF),
          border: Border.all(width: 0.6, color: const Color(0xff979797))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextField(
              keyboardType: keyboard,
              controller: controllerr,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "$petsType $containerText",
                  hintStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff979797)))),
        ),
      ),
    );
  }

  Widget petsImageContainerWidget(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print("RESİM EKLENCEK VE RESİM İZNİ İSTENİCEK");
      },
      child: Container(
          width: size.width / 2,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(41),
              color: const Color(0xffBFFCFF),
              border: Border.all(width: 0.5, color: const Color(0xff979797))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              petsTypeIconBool
                  ? Hero(tag: "catHero", child: Image.asset("assets/cat.png"))
                  : Hero(tag: "dogHero", child: Image.asset("assets/dog.png")),
              Text(
                "Add your $petsType photo",
                style: const TextStyle(color: Color(0xff979797)),
              ),
            ],
          )),
    );
  }

  Widget petsAddButton() {
    return Container(
      width: 70,
      height: 70,
      child: const Image(image: AssetImage("assets/addIcon.png")),
    );
  }
}
