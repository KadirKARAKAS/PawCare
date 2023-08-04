import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paw_care/MyPetsPage/Page/mypets_page.dart';

import 'AddPetsPage/SelectPetTypePage1/Page/select_pet_type_page.dart';
import 'Utils/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 2000),
      () async {
        await handleAppStart();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: const Image(
          image: AssetImage("assets/SplashScreen.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> handleAppStart() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      await FirebaseAuth.instance.signInAnonymously();
      final Map<String, dynamic> mapSaveData =
          Platform.isIOS ? {'Platform': 'iOS'} : {'Platform': 'Android'};

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(mapSaveData);

      runApp(const MaterialApp(
        home: SelectPetTypePage(),
      ));
    } else {
      final userReff = FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Daily ToDoList");
      final querySnapshot = await userReff.get();
      dailyToDoList.clear();
      querySnapshot.docs.forEach((doc) {
        dailyToDoList.add(doc.data());
      });

      final userRef = FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("My Pets");
      final querySnapshotPets = await userRef.get();
      getdataList.clear();
      querySnapshotPets.docs.forEach((doc) {
        getdataList.add(doc.data());
      });

      Future.delayed(const Duration(milliseconds: 500), () async {
        getdataList.isEmpty
            ? Navigator.pushReplacement(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: const SelectPetTypePage(),
                  duration: const Duration(milliseconds: 1250),
                ),
              )
            : setState(() {
                circleBool = false;
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const MyPetsPage(),
                    duration: const Duration(milliseconds: 1250),
                  ),
                );
              });
      });
    }
  }
}
