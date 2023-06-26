
import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/constants/color_constants.dart';
import 'package:harry_potter_app/views/components/custom_shape.dart';

class CustomImageInfo extends StatefulWidget {
   final String name;
   final ImageProvider image;
   final bool isNotCharacter;
  const CustomImageInfo({super.key,required this.name,required this.image,this.isNotCharacter = false});

  @override
  State<CustomImageInfo> createState() => _CustomImageInfoState();
}

class _CustomImageInfoState extends State<CustomImageInfo> {
  @override
  Widget build(BuildContext context) {
     return SizedBox(
      height: 250,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height:230, 
              color: ColorConstants.maastrichtBlue,
            ),
          ),
          if(widget.isNotCharacter)
           Positioned(
            right: 15,
            top:30,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: ColorConstants.pictonBlue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: const Icon(
                Icons.edit,
                color:Colors.white,size: 30,
                ),
            )
            ),
             
          Positioned(
            top:40,
            right: 0,
            left: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Stack(
                    children: [
                       Container(
                       
                      height: 200, //140
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4, //8
                        ),
                        image:  DecorationImage(
                          fit: BoxFit.cover,
                         image: widget.image,
                        ),
                      ),
                    ),
                     if(widget.isNotCharacter)
                     Positioned(
                      bottom: 0,
                      right: 20,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                           color:  ColorConstants.pictonBlue,
                           borderRadius: BorderRadius.circular(50)
                        ),
                       
                        child: const Icon(Icons.camera_alt_rounded,color: Colors.white,))
                      )
                    ],
                  ),
                  
                
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}