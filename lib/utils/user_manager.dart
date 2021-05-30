import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/user_controller.dart';
import '../models/user.dart';

import '../utils/status_manager.dart';

final storage = GetStorage();

var statusManager = StatusManager();

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

  User currentUser() {
    User tempUser = User();
    tempUser.username = storage.read('username').toString() ?? '';
    tempUser.passcode = storage.read('passcode').toString() ?? '';
    tempUser.course = storage.read('course').toString() ?? '2 Year Extended Diploma 1080 Hours';
    tempUser.target = storage.read('target').toString() ?? 'PPP';

    return tempUser;
  }

  String currentUserUsername() {
    User user = currentUser();
    return user.username.toString();
  }

  String currentUserPasscode() {
    User user = currentUser();
    return user.passcode.toString();
  }

  String currentUserCourse() {
    User user = currentUser();
    return user.course.toString();
  }

  String currentUserTarget() {
    User user = currentUser();
    return user.target.toString();
  }

  void clearUser() {
    User user = User();
    user.username = '';
    user.passcode = '';
    user.course = '2 Year Extended Diploma 1080 Hours';
    user.target = 'PPP';

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

    statusManager.storeStatus('unregistered');

    Get.snackbar('User data stored', 'Data for $originalUser cleared');

    Get.toNamed('/login');
  }
}
