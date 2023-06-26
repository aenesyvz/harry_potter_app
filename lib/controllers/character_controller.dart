import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:harry_potter_app/models/character.dart';

import 'package:http/http.dart' as http;
class CharacterController extends GetxController{

  RxList<Character> _characterList = <Character>[].obs;
  RxList<Character> _filteredPosts = <Character>[].obs;

  List<Character> get characterList => _filteredPosts.isNotEmpty ? _filteredPosts.value : _characterList.value;
  Future<void> getAll() async {
    try {
      var url = 'https://hp-api.onrender.com/api/characters';
      var response = await http.get(Uri.parse(url));
       final List<dynamic> responseData = jsonDecode(response.body);
       _characterList.assignAll(responseData.map((item) => Character.fromJson(item)).toList().take(10).toList());
      update();
    } catch (error) {
      rethrow;
    }
  }

  void filterPosts(String searchTerm) {
    if (searchTerm.length < 3) {
      _filteredPosts.clear();
    } else {
      _filteredPosts.assignAll(_characterList.where((character) => character.name!.toLowerCase().contains(searchTerm.toLowerCase())).toList());
    }
  }
}
