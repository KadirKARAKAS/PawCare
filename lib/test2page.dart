import 'package:flutter/material.dart';

class Test2Page extends StatelessWidget {
  const Test2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "DAHA ÖNCE GİRİŞ YAPILDI",
              style: TextStyle(fontSize: 44),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
