import 'package:flutter/material.dart';
import 'package:paw_care/MyPetsPage/Widget/pets_photo_circlelist_widget.dart';
import 'package:paw_care/MyPetsPage/Widget/todo_list_container_widget%20copy.dart';
import 'package:paw_care/MyPetsPage/Widget/todo_list_container_widget.dart';
import 'package:paw_care/topbar_widget.dart';

class MyPetsPage extends StatefulWidget {
  const MyPetsPage({super.key});

  @override
  State<MyPetsPage> createState() => _MyPetsPageState();
}

class _MyPetsPageState extends State<MyPetsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/BackGroundPage.png'),
                    fit: BoxFit.cover)),
          ),
          const SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                TopBarWidget(titleText: "MyPets"),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      PetsPhotoCircleListWidget(),
                      SizedBox(height: 30),
                      ToDoListContainerWidget(),
                      SizedBox(height: 30),
                      VaccinationListContainer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
