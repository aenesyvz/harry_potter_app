import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/constants/color_constants.dart';

class CustomListInfo extends StatelessWidget {
  final String title;
  final List list;
  final Color color;
  const CustomListInfo({super.key,required this.title,required this.list,required this.color});

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty ? 
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: ColorConstants.maastrichtBlue,)),
          const SizedBox(height: 10,),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) => 
             Row(
               children: [
                Icon(Icons.arrow_forward_ios_rounded,color:color),
                const SizedBox(width: 20,),
                 Text(list[index],style: const TextStyle(fontSize: 16),),
               ],
             ),),
        ],
      ),
    ):const Text("");
  }
}