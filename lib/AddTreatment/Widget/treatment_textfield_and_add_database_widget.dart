import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paw_care/HealthHistory/Page/health_history_page.dart';
import 'package:paw_care/Utils/constant.dart';

class TreatmentTextFieldAndAddDataBaseWidget extends StatefulWidget {
  const TreatmentTextFieldAndAddDataBaseWidget({super.key});

  @override
  State<TreatmentTextFieldAndAddDataBaseWidget> createState() =>
      _TreatmentTextFieldAndAddDataBaseWidgetState();
}

final TextEditingController nameTreatment = TextEditingController();
final TextEditingController dateTreatment = TextEditingController();
final TextEditingController clinicTreatment = TextEditingController();
final TextEditingController doctorTreatment = TextEditingController();

class _TreatmentTextFieldAndAddDataBaseWidgetState
    extends State<TreatmentTextFieldAndAddDataBaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            textFieldContainerWidget(context, "Foreign body swallowing surgery",
                "Type of treatment applied", nameTreatment, TextInputType.name),
            const SizedBox(height: 10),
            textFieldContainerWidget(
                context,
                "10/09/2022",
                "On which date it was made",
                dateTreatment,
                TextInputType.datetime),
            const SizedBox(height: 10),
            textFieldContainerWidget(
                context,
                "Animal Health Center",
                "Name of the clinic where the treatment was performed",
                clinicTreatment,
                TextInputType.name),
            const SizedBox(height: 10),
            textFieldContainerWidget(
                context,
                "Jack Pate",
                "Name of the treating doctor",
                doctorTreatment,
                TextInputType.name),
            const SizedBox(height: 40),
            petsAddButton(),
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
    return SizedBox(
      width: 70,
      height: 70,
      child: InkWell(
        onTap: () async {
          // setState(() {
          //   circleBool = true;
          // });
          await addToDatabase();
        },
        child: const Image(image: AssetImage("assets/addIcon.png")),
      ),
    );
  }

  Future<void> addToDatabase() async {
    String nameTreat = nameTreatment.text.trim();
    String datenameTreat = dateTreatment.text.trim();
    String clinicTreat = clinicTreatment.text.trim();
    String docTreat = doctorTreatment.text.trim();

    if (nameTreat.isEmpty ||
        datenameTreat.isEmpty ||
        clinicTreat.isEmpty ||
        docTreat.isEmpty) {
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
      "NameTreatment": nameTreat,
      "DateTreatment": datenameTreat,
      "ClinicTreatment": clinicTreat,
      "DoctorTreatment": docTreat,
      'createdTime': DateTime.now()
    };

    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Treatment History")
          .add(plant);
      nameTreatment.clear();
      dateTreatment.clear();
      clinicTreatment.clear();
      doctorTreatment.clear();

      //VERİLERİ FİRABASE'E EKLEDİK VE BUNDAN SONRASI VERİLERİ FİREBASEDEN ÇEKME İŞLEMİ
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
