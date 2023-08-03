import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paw_care/HealthHistory/Page/health_history_page.dart';
import 'package:paw_care/Utils/constant.dart';

class VaccinationTextFieldAdddataBaseWidget extends StatefulWidget {
  const VaccinationTextFieldAdddataBaseWidget({super.key});

  @override
  State<VaccinationTextFieldAdddataBaseWidget> createState() =>
      _VaccinationTextFieldAdddataBaseWidgetState();
}

final TextEditingController nameVaccination = TextEditingController();
final TextEditingController dateVaccination = TextEditingController();
final TextEditingController clinicVaccination = TextEditingController();
final TextEditingController doctorVaccination = TextEditingController();

class _VaccinationTextFieldAdddataBaseWidgetState
    extends State<VaccinationTextFieldAdddataBaseWidget> {
  @override
  Widget build(BuildContext context) {
    ;
    return Stack(
      children: [
        Column(
          children: [
            textFieldContainerWidget(
                context,
                "Rabies",
                "Enter vaccination information",
                nameVaccination,
                TextInputType.name),
            const SizedBox(height: 10),
            textFieldContainerWidget(
                context,
                "10/09/2022",
                "Enter the date of vaccination",
                dateVaccination,
                TextInputType.datetime),
            const SizedBox(height: 10),
            textFieldContainerWidget(
                context,
                "Animal Health Center",
                "Enter the name of the clinic where you received the vaccine",
                clinicVaccination,
                TextInputType.name),
            const SizedBox(height: 10),
            textFieldContainerWidget(
                context,
                "Jack Pate",
                "Enter the name of the vaccinating doctor",
                doctorVaccination,
                TextInputType.name),
            const SizedBox(height: 40),
            Align(alignment: Alignment.centerRight, child: petsAddButton()),
          ],
        ),
        loadingCircle()
      ],
    );
  }

  Widget textFieldContainerWidget(
      BuildContext context,
      String containerText,
      String containerTopText,
      TextEditingController controllerR,
      TextInputType keyboardTypeSelect) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(containerTopText,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                  textAlign: TextAlign.start,
                  softWrap: true)),
        ),
        const SizedBox(height: 3),
        Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffE0FEFF),
              border: Border.all(width: 0.4, color: const Color(0xff979797))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                keyboardType: keyboardTypeSelect,
                controller: controllerR,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: containerText,
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff979797))),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget petsAddButton() {
    return Container(
      width: 70,
      height: 70,
      child: InkWell(
        onTap: () async {
          setState(() {
            circleBool = true;
          });
          await addToDatabase();
        },
        child: Image(image: AssetImage("assets/addIcon.png")),
      ),
    );
  }

  Future<void> addToDatabase() async {
    String nameVac = nameVaccination.text.trim();
    String dateVac = dateVaccination.text.trim();
    String clinicVac = clinicVaccination.text.trim();
    String docVac = doctorVaccination.text.trim();

    if (nameVac.isEmpty ||
        dateVac.isEmpty ||
        clinicVac.isEmpty ||
        docVac.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Warning'),
            content: const Text('Please fill in all fields.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Okey'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    final plant = {
      "NameVaccination": nameVac,
      "DateVaccination": dateVac,
      "ClinicVaccination": clinicVac,
      "DoctorVaccination": docVac,
      'createdTime': DateTime.now()
    };

    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Vaccination History")
          .add(plant);
      nameVaccination.clear();
      dateVaccination.clear();
      clinicVaccination.clear();
      doctorVaccination.clear();

      //VERİLERİ FİRABASE'E EKLEDİK VE BUNDAN SONRASI VERİLERİ FİREBASEDEN ÇEKME İŞLEMİ
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
      Future.delayed(const Duration(milliseconds: 400), () {
        valueNotifierX.value += 1;
      });
      setState(() {
        circleBool = false;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HealthHistoryPage(),
            ));
      });
    } catch (error) {
      print('Error adding data to Firestore: $error');
    }
  }

  Stack loadingCircle() {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (circleBool)
          Container(
            width: size.width,
            height: size.height - 200,
            color: Colors.transparent,
          ),
        circleBool
            ? const SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 10,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff60F9FF)),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
