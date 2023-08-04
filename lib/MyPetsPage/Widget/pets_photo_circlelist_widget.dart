import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paw_care/AddPetsPage/SelectPetTypePage1/Page/select_pet_type_page.dart';
import 'package:paw_care/Utils/constant.dart';

class PetsPhotoCircleListWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const PetsPhotoCircleListWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 105,
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: getdataList.length + 1,
          itemBuilder: (context, index) {
            if (index == getdataList.length) {
              return addPetPlusIconWidget(context);
            }
            return photoListContainerWidget(index, context);
          },
        ),
      ),
    );
  }

  Widget photoListContainerWidget(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 105,
        height: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: CachedNetworkImage(
            imageUrl: getdataList[index]["PetsPhotoURL"],
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }

  Widget addPetPlusIconWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SelectPetTypePage(),
            ));
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/plus.png"), scale: 1.7),
            borderRadius: BorderRadius.circular(999)),
      ),
    );
  }
}
