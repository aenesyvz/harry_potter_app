import 'package:get/get.dart';
import 'package:harry_potter_app/controllers/character_controller.dart';

class InitDependency extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CharacterController());
  }
}