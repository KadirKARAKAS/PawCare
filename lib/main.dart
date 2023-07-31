import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paw_care/AddPetsPage/SelectPetTypePage1/Page/select_pet_type_page.dart';
import 'package:paw_care/denemepage.dart';
import 'package:paw_care/testpage.dart';
import 'Utils/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  handleAppStart();
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
    final userRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("My Pets");

    final querySnapshot = await userRef.get();
    getdataList.clear();
    querySnapshot.docs.forEach((doc) {
      getdataList.add(doc.data());
    });
    if (getdataList.isEmpty) {
      runApp(const MaterialApp(
        home: SelectPetTypePage(),
      ));
    } else {
      runApp(const MaterialApp(
        home: DenemePage(),
      ));
    }
  }
}
