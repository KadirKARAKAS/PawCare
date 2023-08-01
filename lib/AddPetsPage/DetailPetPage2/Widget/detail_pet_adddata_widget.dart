import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paw_care/MyPetsPage/Page/mypets_page.dart';
import 'package:paw_care/Utils/constant.dart';
import 'package:paw_care/topbar_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class DetailPetAdddataWidget extends StatefulWidget {
  const DetailPetAdddataWidget({super.key});

  @override
  State<DetailPetAdddataWidget> createState() => _DetailPetAdddataWidgetState();
}

final ImagePicker picker = ImagePicker();
String selectedImagePath = '';
final TextEditingController petsNameController = TextEditingController();
final TextEditingController petsAgeController = TextEditingController();
final TextEditingController petsBreedController = TextEditingController();
final TextEditingController petsGenderController = TextEditingController();

class _DetailPetAdddataWidgetState extends State<DetailPetAdddataWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Center(),
        const SizedBox(
          height: 30,
        ),
        const TopBarWidget(titleText: "Add Pet's"),
        Stack(
          children: [
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
                const SizedBox(height: 50),
                petsAddButton(),
              ],
            ),
            loadingCircle(size),
          ],
        ),
      ],
    );
  }

  Stack loadingCircle(Size size) {
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
      onTap: () async {
        var status = await Permission.storage.status;
        print(status);
        if (status.isDenied) {
          await Permission.storage.request().then((value) {
            if (value.isGranted) {
              addPhotoFunction();
            }
          });
        } else if (status.isGranted) {
          addPhotoFunction();
          print('İzin önceden soruldu ve kullanıcı izni verdi');
        } else {
          openAppSettings();
          print('İzin önceden soruldu ve kullanıcı izni vermedi');
        }
      },
      child: Container(
        width: size.width / 2,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(41),
            color: const Color(0xffBFFCFF),
            border: Border.all(width: 0.5, color: const Color(0xff979797))),
        child: selectedImagePath == ""
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  petsTypeIconBool
                      ? Hero(
                          tag: "catHero", child: Image.asset("assets/cat.png"))
                      : Hero(
                          tag: "dogHero", child: Image.asset("assets/dog.png")),
                  Text(
                    "Add your $petsType photo",
                    style: const TextStyle(color: Color(0xff979797)),
                  ),
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(41),
                child: Image.file(
                  File(selectedImagePath),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }

  Widget petsAddButton() {
    return InkWell(
      onTap: () async {
        setState(() {
          circleBool = true;
        });
        await storageSave();
        await addToDatabase();
      },
      child: const SizedBox(
        width: 70,
        height: 70,
        child: Image(image: AssetImage("assets/addIcon.png")),
      ),
    );
  }

  addPhotoFunction() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImagePath = image.path;
      setState(() {});
    }
  }

  storageSave() async {
    print('start');
    List<String> imagePathList = selectedImagePath.split('/');
    await FirebaseStorage.instance
        .ref('PetsPhoto')
        .child(imagePathList[imagePathList.length - 1])
        .putFile(File(selectedImagePath));
    final imageUrl = await FirebaseStorage.instance
        .ref('PetsPhoto/${imagePathList[imagePathList.length - 1]}')
        .getDownloadURL();
    imageURLL = imageUrl;
  }

  Future<void> addToDatabase() async {
    String petName = petsNameController.text;
    String petAge = petsAgeController.text;
    String petBreed = petsBreedController.text;
    String petGender = petsGenderController.text;

    final plant = {
      "PetsType": petsType,
      "PetsName": petName,
      "PetsAge": petAge,
      "PetsBreed": petBreed,
      "PetsGender": petGender,
      "PetsPhotoURL": imageURLL,
      'createdTime': DateTime.now()
    };

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("My Pets")
        .doc()
        .set(plant);
    petsNameController.clear();
    petsAgeController.clear();
    petsBreedController.clear();
    petsGenderController.clear();
    selectedImagePath = "";

    //VERİLERİ FİRABASE'E EKLEDİK VE BUNDAN SONRASI VERİLERİ FİREBASEDEN ÇEKME İŞLEMİ
    final userRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("My Pets")
        .orderBy('createdTime', descending: true);

    final querySnapshot = await userRef.get();
    getdataList.clear();
    querySnapshot.docs.forEach((doc) {
      getdataList.add(doc.data());
    });
    petsNameController.clear();
    petsAgeController.clear();
    petsBreedController.clear();
    petsGenderController.clear();
    setState(() {
      circleBool = false;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyPetsPage(),
          ));
    }); //VERİ EKLEME VE ÇEKME İŞLEMİ TAMAMLANDIKTAN SONRA CİRCLE I KAPATIYOR VE DİĞER SAYFAYA GEÇİYORUZ.
  }
}
