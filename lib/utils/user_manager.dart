import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/user_controller.dart';
import '../models/user.dart';

final storage = GetStorage();

class UserManager {
  UserDataController userController = Get.find<UserDataController>();

  void storeUser(User user) {
    // -- persist username
    storage.write('username', user.username);
    userController.updateUsername(user.username);
    // -- persist passcode
    storage.write('passcode', user.passcode);
    userController.updatePasscode(user.passcode);
    // -- persist course
    storage.write('course', user.course);
    userController.updateCourse(user.course);
    // -- persist target
    storage.write('target', user.target);
    userController.updateTarget(user.target);

    Get.snackbar('User data stored', 'Data for ${userController.username} stored');
  }

  void clearUser() {
    User user = User();
    user.username = '';
    user.passcode = '';
    user.course = '';
    user.target = '';

    String originalUser = userController.username.toString();

    // -- persist username
    storage.write('username', user.username);
    userController.updateUsername(user.username);
    // -- persist passcode
    storage.write('passcode', user.passcode);
    userController.updatePasscode(user.passcode);
    // -- persist course
    storage.write('course', user.course);
    userController.updateCourse(user.course);
    // -- persist target
    storage.write('target', user.target);
    userController.updateTarget(user.target);

    Get.snackbar('User data stored', 'Data for $originalUser cleared');
  }
}
