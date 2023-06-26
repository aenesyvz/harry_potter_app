
import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/constants/color_constants.dart';
import 'package:harry_potter_app/models/character.dart';
import 'package:harry_potter_app/views/components/custom_image_info.dart';
import 'package:harry_potter_app/views/components/custom_list_info.dart';
import 'package:harry_potter_app/views/components/custom_single_info.dart';

class CharacterDetailPage extends StatefulWidget {
  final Character character;
  const CharacterDetailPage({super.key,required this.character});

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.maastrichtBlue,
        title: Text(widget.character.name ?? "İsimsiz"),
        elevation: 0,
        leading: GestureDetector(
                onTap: (() {
                  Navigator.pop(context);
                }),
                child: const Icon(Icons.arrow_back_ios,color: ColorConstants.white,size: 30,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
                CustomImageInfo(name: "a", image: NetworkImage(widget.character.image!)),

                CustomListInfo(title:"Alternate Actor",list: widget.character.alternateActors!,color: ColorConstants.pictonBlue),
                CustomListInfo(title:"Alternate Names",list : widget.character.alternateNames!,color: ColorConstants.pictonBlue),
              
                CustomSingleInfo(title: "Species",info : widget.character.species),
                CustomSingleInfo(title: "Gender", info: widget.character.gender),
                CustomSingleInfo(title: "House", info: widget.character.house),
                CustomSingleInfo(title: "Date Of Birth", info:widget.character.dateOfBirth),
                CustomSingleInfo(title: "Year Of Birth",info: widget.character.yearOfBirth),
                CustomSingleInfo(title: "Wizard", info:widget.character.wizard),
                CustomSingleInfo(title: "Hair Color",info: widget.character.hairColour),
                CustomSingleInfo(title: "Eye Color", info:widget.character.eyeColour),
                CustomSingleInfo(title: "Patronus", info:widget.character.patronus),
                CustomSingleInfo(title: "Ancestry", info: widget.character.ancestry),
          ],
        ),
      ),
    );
  }
}