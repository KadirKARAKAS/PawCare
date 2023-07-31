import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paw_care/test2page.dart';

import 'Utils/constant.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

final TextEditingController textFieldController1 = TextEditingController();

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 200),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                addToDatabase();
              },
            ),
          ],
        ),
      ),
    );
  }

  Container eklebutonu() {
    return Container(
      width: 50,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text("Ekle")),
    );
  }

  Container textfield1(Size size, String hintText) {
    return Container(
      width: size.width,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(9)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: textFieldController1,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 20),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
          ),
        ),
      ),
    );
  }

  Future<void> addToDatabase() async {
    final plant = {
      "PetsType": petsType,
    };

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("My Pets")
        .doc()
        .set(plant);
    textFieldController1.clear();
    final userRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("My Pets");

    final querySnapshot = await userRef.get();
    getdataList.clear();
    querySnapshot.docs.forEach((doc) {
      getdataList.add(doc.data());
    });

    textFieldController1.clear();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Test2Page(),
        ));
  }
}
