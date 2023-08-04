import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paw_care/Utils/constant.dart';

class ToDoListContainerWidget extends StatefulWidget {
  const ToDoListContainerWidget({super.key});

  @override
  State<ToDoListContainerWidget> createState() =>
      _ToDoListContainerWidgetState();
}

class _ToDoListContainerWidgetState extends State<ToDoListContainerWidget> {
  final TextEditingController dailyTextController = TextEditingController();

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
          child: Text(
            "Daily To-Do's",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: dailyToDoList.length + 1,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == dailyToDoList.length) {
                  return dailyToDoList.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage("assets/taskarrow.png"),
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 5),
                              SizedBox(
                                width: 270,
                                child: Text(
                                    "Add and remember what you do to your pet every day.",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    textAlign: TextAlign.start,
                                    softWrap: true),
                              )
                            ],
                          ),
                        )
                      : const SizedBox();
                }
                return defaultToDoListTextWidget(index);
              },
            ),
          ),
        ),
        Positioned(
            top: 20,
            right: 30,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return addDailyListAlertDialog();
                    });
              },
              child: const Image(
                image: AssetImage("assets/plus.png"),
                width: 20,
                height: 20,
              ),
            )),
      ],
    );
  }

  Positioned toDoListFirsText() {
    return const Positioned(
      top: 120,
      left: 95,
      child: SizedBox(
        width: 100,
        child: Text(
          "Here you can write down what you need to do for your pets on a daily basis.",
          style: TextStyle(
              color: Color(0xff979797),
              fontWeight: FontWeight.w500,
              fontSize: 16),
          textAlign: TextAlign.start,
          softWrap: true,
        ),
      ),
    );
  }

  Widget defaultToDoListTextWidget(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Row(
        children: [
          const Image(
            image: AssetImage("assets/taskarrow.png"),
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 5),
          Expanded(
              child: Text(dailyToDoList[index]["DailyToDo"],
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  textAlign: TextAlign.start,
                  softWrap: true))
        ],
      ),
    );
  }

  Widget addDailyListAlertDialog() {
    return AlertDialog(
      title: const Text('Add Daily To-Do\'s'),
      content: TextField(
        controller: dailyTextController,
      ),
      actions: [
        TextButton(
          onPressed: () {
            addToDatabase();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  Future<void> addToDatabase() async {
    String dailyToDoText = dailyTextController.text;
    ;

    final plant = {"DailyToDo": dailyToDoText, 'createdTime': DateTime.now()};

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Daily ToDoList")
        .doc()
        .set(plant);
    dailyTextController.clear();

    //VERİLERİ FİRABASE'E EKLEDİK VE BUNDAN SONRASI VERİLERİ FİREBASEDEN ÇEKME İŞLEMİ
    final userRef = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Daily ToDoList")
        .orderBy('createdTime', descending: true);

    final querySnapshot = await userRef.get();
    dailyToDoList.clear();
    querySnapshot.docs.forEach((doc) {
      dailyToDoList.add(doc.data());
    });
    dailyTextController.clear();

    setState(() {
      // circleBool = false;
      Navigator.pop(context);
    }); //VERİ EKLEME VE ÇEKME İŞLEMİ TAMAMLANDIKTAN SONRA CİRCLE I KAPATIYOR VE DİĞER SAYFAYA GEÇİYORUZ.
  }
}
