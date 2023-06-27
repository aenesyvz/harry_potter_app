
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harry_potter_app/core/constants/color_constants.dart';
import 'package:harry_potter_app/models/character.dart';
import 'package:harry_potter_app/views/components/custom_image_info.dart';
import 'package:harry_potter_app/views/components/custom_list_info.dart';
import 'package:harry_potter_app/views/components/custom_single_info.dart';


class CharacterDetailPage extends StatelessWidget {
  final Character character;
  
   const CharacterDetailPage({super.key,required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.maastrichtBlue,
        title: Text(character.name ?? "İsimsiz"),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios, color: ColorConstants.white, size: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImageInfo(name: "a", image: NetworkImage(character.image!)),
            CustomListInfo(title: "Alternate Actor", list: character.alternateActors!, color: ColorConstants.pictonBlue),
            CustomListInfo(title: "Alternate Names", list: character.alternateNames!, color: ColorConstants.pictonBlue),
            CustomSingleInfo(title: "Species", info: character.species),
            CustomSingleInfo(title: "Gender", info: character.gender),
            CustomSingleInfo(title: "House", info: character.house),
            CustomSingleInfo(title: "Date Of Birth", info: character.dateOfBirth),
            CustomSingleInfo(title: "Year Of Birth", info: character.yearOfBirth),
            CustomSingleInfo(title: "Wizard", info: character.wizard),
            CustomSingleInfo(title: "Hair Color", info: character.hairColour),
            CustomSingleInfo(title: "Eye Color", info: character.eyeColour),
            CustomSingleInfo(title: "Patronus", info: character.patronus),
            CustomSingleInfo(title: "Ancestry", info: character.ancestry),
          ],
        ),
      ),
    );
  }
}
