
import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/constants/color_constants.dart';
import 'package:harry_potter_app/models/character.dart';
import 'package:harry_potter_app/views/components/custom_image_info.dart';
import 'package:harry_potter_app/views/components/custom_list_info.dart';
import 'package:harry_potter_app/views/components/custom_single_info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   var myInfo = Character(
   id: "37",
   name: "Alper Enes Yavuz",
   alternateNames: ["Uzun Adam","Asker","Teğmen"],
   species: "Tosyalı",
   gender: "male",
   house: "Tosya / Kastamonu",
   dateOfBirth: "18-02-2002",
   yearOfBirth: 2002,
   wizard: true,
   ancestry: null,
   hairColour: "Black",
   wand: Wand(core: "---",length: 3,wood: "***"),
   actor: "Çilekes",
   alive: true,
   alternateActors: ["dssjfsd","sjcsdk"],
   eyeColour: "black",
   hogwartsStaff: true,
   hogwartsStudent: true,
   image: "assets/img/aey37.png",
   patronus: "boş"
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: ColorConstants.maastrichtBlue,
        title: Text(myInfo.name!),
        elevation: 0,
        leading: GestureDetector(
                onTap: (() {
                  Navigator.pop(context);
                }),
                child: const Icon(Icons.arrow_back_ios,color: ColorConstants.white,size: 30,)),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomImageInfo(
                image: AssetImage(myInfo.image!),
                name: myInfo.name!,
              ),
              const SizedBox(height: 40),
      
              CustomListInfo(title: "Alternate Actor",list: myInfo.alternateActors!,color:ColorConstants.pictonBlue),
              CustomListInfo(title: "Alternate Names",list: myInfo.alternateNames!,color:ColorConstants.pictonBlue),
      
              CustomSingleInfo(title:"Species",info: myInfo.species),
              CustomSingleInfo(title:"Gender",info: myInfo.gender),
              CustomSingleInfo(title:"House", info: myInfo.house),
              CustomSingleInfo(title:"Date Of Birth",info: myInfo.dateOfBirth),
              CustomSingleInfo(title:"Year Of Birth",info: myInfo.yearOfBirth),
              CustomSingleInfo(title:"Wizard", info:myInfo.wizard),
              CustomSingleInfo(title:"Hair Color",info: myInfo.hairColour),
              CustomSingleInfo(title:"Eye Color",info: myInfo.eyeColour),
              CustomSingleInfo(title:"Patronus",info: myInfo.patronus),
              CustomSingleInfo(title:"Ancestry",info: myInfo.ancestry),
              
            ],
          ),
        ),
      ),
    );
  }
}