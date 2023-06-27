

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harry_potter_app/core/constants/color_constants.dart';
import 'package:harry_potter_app/views/home/home_page.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomePage()))
    });

    return const Scaffold(
      backgroundColor: ColorConstants.maastrichtBlue,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Text("IsTechSoft",style: TextStyle(color: Colors.white,fontSize: 72,fontWeight: FontWeight.bold),),
              SizedBox(height: 50,),
              SpinKitFadingCircle(
                color:Colors.white,
                size:50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
