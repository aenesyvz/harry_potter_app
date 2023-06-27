import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harry_potter_app/controllers/character_controller.dart';
import 'package:harry_potter_app/core/constants/color_constants.dart';
import 'package:harry_potter_app/models/character.dart';
import 'package:harry_potter_app/views/characters/character_detail_page.dart';

class CharacterListPage extends StatelessWidget {
  final characterController = Get.find<CharacterController>();
  final TextEditingController searchController = TextEditingController();

  CharacterListPage({super.key}){
    characterController.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  SingleChildScrollView body() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      dragStartBehavior: DragStartBehavior.start,
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 250,
                child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: ColorConstants.maastrichtBlue,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30)),
                  ),
                ),
              ),
              const Positioned(
                top: 100,
                left: 40,
                child: Text(
                  "WELCOME !",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 220,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      characterController.filterPosts(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hintText: "Search Actor",
                      hintStyle: TextStyle(color: Colors.grey.shade700),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Actor Top 10"),
                Text(
                  "View All",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Obx(() {
            final List<Character> characters = characterController.characterList;
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterDetailPage(
                            character: characters[index],
                          ),
                        ),
                      );
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        characters[index].image.toString(),
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(characters[index].name.toString()),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
