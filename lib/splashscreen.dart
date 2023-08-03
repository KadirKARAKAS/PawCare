// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:paw_care/MyPetsPage/Page/mypets_page.dart';

import 'AddPetsPage/SelectPetTypePage1/Page/select_pet_type_page.dart';
import 'Utils/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
      Map<String, dynamic> mapSaveData = {};
      if (Platform.isIOS) {
        mapSaveData = {'Platform': 'iOS'};
      } else {
        mapSaveData = {'Platform': 'Android'};
      }
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(mapSaveData);

      runApp(const MaterialApp(
        home: SelectPetTypePage(),
      ));
    } else {
      //GETDATALİST VERİLERİNİ LİSTEYE ÇEKME AŞAMASI
      final userRef = FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("My Pets");
      final querySnapshot = await userRef.get();
      getdataList.clear();
      querySnapshot.docs.forEach((doc) {
        getdataList.add(doc.data());
      });
      //DAİLY TO DO LİST VERİLERİNİ LİSTEYE ÇEKME AŞAMASI
      final userReff = FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Daily ToDoList");
      final querysnapshot = await userReff.get();
      dailyToDoList.clear();
      querysnapshot.docs.forEach((doc) {
        dailyToDoList.add(doc.data());
        //VACCİNATİON VERİLERİNİ LİSTEYE ÇEKME AŞAMASI:
      });
      final userRefff = FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Vaccination History")
          .orderBy('createdTime', descending: true);

      final querySnapshoot = await userRefff.get();
      petsVaccinationList.clear();
      querySnapshoot.docs.forEach((doc) {
        petsVaccinationList.add(doc.data());
      });
      //treatmentList VERİLERİNİ LİSTEYE ÇEKME
      final userReffff = FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Treatment History")
          .orderBy('createdTime', descending: true);

      final querySnapshootTT = await userReffff.get();
      petsTreatmentList.clear();
      querySnapshootTT.docs.forEach((doc) {
        petsTreatmentList.add(doc.data());
      });
      if (getdataList.isEmpty) {
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: const SelectPetTypePage(),
                duration: const Duration(milliseconds: 1250)));
      } else {
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: const MyPetsPage(),
                duration: const Duration(milliseconds: 1250)));
      }
    }
  }
}
