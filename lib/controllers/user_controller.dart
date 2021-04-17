import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserDataController extends GetxController {
  final storage = GetStorage();

  var username = ''.obs;
  var passcode = ''.obs;
  var course = ''.obs;
  var target = ''.obs;

  @override
  void onInit() {
    username.value = storage.read('username') ?? '';
    passcode.value = storage.read('passcode') ?? '';
    course.value = storage.read('course') ?? '';
    target.value = storage.read('target') ?? '';
    super.onInit();
  }

  // -- Methods for update
  void updateUsername(String newUsername) {
    username.value = newUsername;
    update();
  }

  void updatePasscode(String newPasscode) {
    passcode.value = newPasscode;
    update();
  }

  void updateCourse(String newCourse) {
    course.value = newCourse;
    update();
  }

  void updateTarget(String newTarget) {
    target.value = newTarget;
    update();
  }
}
