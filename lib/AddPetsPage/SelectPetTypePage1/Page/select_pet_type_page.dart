import 'package:flutter/material.dart';
import 'package:paw_care/AddPetsPage/SelectPetTypePage1/Widget/select_pet_type_page_widget.dart';

class SelectPetTypePage extends StatefulWidget {
  const SelectPetTypePage({super.key});

  @override
  State<SelectPetTypePage> createState() => _SelectPetTypePageState();
}

class _SelectPetTypePageState extends State<SelectPetTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/BackGroundPage.png"),
                  fit: BoxFit.cover)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SelectPetTypePageWidget(),
        )
      ],
    ));
  }
}
