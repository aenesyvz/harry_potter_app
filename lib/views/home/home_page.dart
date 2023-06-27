import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:harry_potter_app/core/constants/color_constants.dart';
import 'package:harry_potter_app/views/characters/character_list_page.dart';
import 'package:harry_potter_app/views/profile/profile_page.dart';

class HomePage extends StatelessWidget {
  final List<Widget> items = [
    CharacterListPage(),
    ProfilePage(),
  ];

  final RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => customNavigationBar()),
      body: Obx(() => items[selectedIndex.value]),
    );
  }

  Container customNavigationBar() {
    return Container(
      color: ColorConstants.maastrichtBlue,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: GNav(
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: ColorConstants.white),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          backgroundColor: ColorConstants.maastrichtBlue,
          color: ColorConstants.white,
          activeColor: ColorConstants.white,
          tabBackgroundColor: ColorConstants.brightNavyBlue,
          padding: const EdgeInsets.all(10),
          gap: 20,
          curve: Curves.easeOutExpo,
          onTabChange: (value) {
            selectedIndex.value = value;
          },
          selectedIndex: selectedIndex.value,
          tabs: const [
            GButton(
              icon: Icons.list_sharp,
              text: "Search",
            ),
            GButton(
              icon: Icons.person,
              text: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}