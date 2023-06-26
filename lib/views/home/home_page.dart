import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:harry_potter_app/core/constants/color_constants.dart';
import 'package:harry_potter_app/models/character.dart';
import 'package:harry_potter_app/views/characters/character_list_page.dart';
import 'package:harry_potter_app/views/profile/profile_page.dart';
class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List items = [
    const CharacterListPage(),
    const ProfilePage()
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customNavigationBar(),
      body: items[_selectedIndex],
    );
  }

   Container customNavigationBar() {
    return Container(
      color: ColorConstants.maastrichtBlue,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: GNav(
          textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:ColorConstants.white),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          backgroundColor:ColorConstants.maastrichtBlue,
          color: ColorConstants.white,
          activeColor:ColorConstants.white,
          tabBackgroundColor:ColorConstants.brightNavyBlue,
          padding: const EdgeInsets.all(10),
          gap:20,
          curve: Curves.easeOutExpo, 
            // tabBorder: Border.all(color: Colors.grey, width: 1),
          onTabChange: (value) {
            setState(() {
              _selectedIndex = value;
            });
            
          },
          tabs: const [
            GButton(
              icon: Icons.list_sharp,
              text: "Search",),
            GButton(
              icon: Icons.person,
              text: "Profile",
            )
          ],
        ),
      ),
    );
}
}