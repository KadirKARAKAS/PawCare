import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paw_care/HealthHistory/Page/health_history_page.dart';
import 'package:paw_care/Utils/constant.dart';

class VaccinationListContainer extends StatefulWidget {
  const VaccinationListContainer({super.key});

  @override
  State<VaccinationListContainer> createState() =>
      _VaccinationListContainerState();
}

class _VaccinationListContainerState extends State<VaccinationListContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: 270,
          decoration: BoxDecoration(
              color: const Color(0xffBFFCFF),
              borderRadius: BorderRadius.circular(34),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 3, color: Colors.black26, offset: Offset(-2, 2))
              ]),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 25),
          child: Text("Health History",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 55, left: 10),
          child: healHistoryContainerRow(),
        ),
      ],
    );
  }

  Widget healHistoryContainerRow() {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        height: 190,
        child: ListView.builder(
          padding: const EdgeInsets.only(right: 10),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: getdataList.length,
          itemBuilder: (context, index) {
            return petPhotoContainer(index);
          },
        ),
      ),
    );
  }

  Widget petPhotoContainer(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () async {
          selectedIndex = index;
          petDetailPageIndex = index;
          //   //VACCİNATİON VERİLERİNİ LİSTEYE ÇEKME AŞAMASI:
          final userRefff = FirebaseFirestore.instance
              .collection("Users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("My Pets")
              .doc(getdataList[index]["docId"])
              .collection("Vaccination History")
              .orderBy('createdTime', descending: true);

          final querySnapshoot = await userRefff.get();
          petsVaccinationList.clear();
          querySnapshoot.docs.forEach((doc) {
            petsVaccinationList.add(doc.data());
          });
          // //treatmentList VERİLERİNİ LİSTEYE ÇEKME
          final userReffff = FirebaseFirestore.instance
              .collection("Users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("My Pets")
              .doc(getdataList[selectedIndex]["docId"])
              .collection("Treatment History")
              .orderBy('createdTime', descending: true);

          final querySnapshootTT = await userReffff.get();
          petsTreatmentList.clear();
          querySnapshootTT.docs.forEach((doc) {
            petsTreatmentList.add(doc.data());
          });
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HealthHistoryPage(),
              ));
        },
        child: Container(
          width: 150,
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: CachedNetworkImage(
              imageUrl: getdataList[index]["PetsPhotoURL"],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
