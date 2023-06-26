
import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/constants/color_constants.dart';

class CustomSingleInfo extends StatelessWidget {
  final String title;
  final dynamic info;
  const CustomSingleInfo({super.key,required this.title,required this.info});

  @override
  Widget build(BuildContext context) {
      return info != null ?  
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:ColorConstants.maastrichtBlue,),),
            const SizedBox(width: 20,),
            Text("$info".toUpperCase())
          ],
        ),
      ):const Text("");
  }
}