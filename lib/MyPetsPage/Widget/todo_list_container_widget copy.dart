import 'package:flutter/material.dart';

class ToDoListContainerWidget extends StatefulWidget {
  const ToDoListContainerWidget({super.key});

  @override
  State<ToDoListContainerWidget> createState() =>
      _ToDoListContainerWidgetState();
}

class _ToDoListContainerWidgetState extends State<ToDoListContainerWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 270,
      decoration: BoxDecoration(
          color: const Color(0xffBFFCFF),
          borderRadius: BorderRadius.circular(34),
          boxShadow: const [
            BoxShadow(
                blurRadius: 3, color: Colors.black26, offset: Offset(-2, 2))
          ]),
    );
  }
}
