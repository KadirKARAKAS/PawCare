import 'package:flutter/material.dart';
import 'package:paw_care/Utils/constant.dart';

class PetsPhotoCircleListWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const PetsPhotoCircleListWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: getdataList.length,
        itemBuilder: (context, index) {
          return photoListContainerWidget(index, context);
        },
      ),
    );
  }

  Widget photoListContainerWidget(int index, BuildContext context) {
    return Container(
      width: 115,
      height: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: Image(
          image: NetworkImage(getdataList[index]["PetsPhotoURL"]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
