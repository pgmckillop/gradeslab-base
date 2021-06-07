import 'package:flutter/material.dart';
import 'package:grades_lab_hive_getx/controllers/user_controller.dart';
import '../widgets/dropdown_wrapper.dart';
import '../widgets/dropdown_control.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/status_controller.dart';
import '../utils/status_manager.dart';
import '../utils/user_manager.dart';

import '../models/user.dart';

import '../uidata/course_data.dart';

import '../utils/default_data.dart';

class PageSettings extends StatefulWidget {
  @override
  _PageSettingsState createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  var statusController = Get.find<StatusController>();
  var userController = Get.find<UserDataController>();

  String _chosenCourse;
  String _chosenProfile;
  String _username = '';

  //String _passcode = '';

  bool isPasscodeVisible = false;
  var firstUse = false;

  // -- TextField Controllers
  final usernameController = TextEditingController();
  final passcodeController = TextEditingController();

  var storage = GetStorage();
  User _user = User();

  StatusManager statusManager = StatusManager();
  UserManager userManager = UserManager();

  @override
  void initState() {
    usernameController.addListener(() => setState(() {}));
    usernameController.text = storage.read('username').toString() ?? '';
    _username = storage.read('username').toString() ?? '';

    passcodeController.addListener(() => setState(() {}));
    passcodeController.text = storage.read('passcode').toString() ?? '';
    _chosenCourse = storage.read('course').toString() ?? '';
    _chosenProfile = storage.read('target').toString() ?? '';

    // if (!firstUse) {
    //   _chosenCourse = storage.read('course').toString() ?? ''; // -- THIS CAUSES THE DROPDOWN CRASH
    //   _chosenProfile = storage.read('target').toString() ?? ''; //-- DITTO
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // -- variable for action response to store default grades
    firstUse = statusController.status.toString() == 'unregistered';

    DefaultData defaultDataManager = DefaultData();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return firstUse
                ? Container()
                : IconButton(
                    icon: const Icon(
                      Icons.home,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Get.toNamed('/switchboard');
                    },
                  );
          },
        ),
        title: Text(
          'SETTINGS',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.transform),
        //     color: Theme.of(context).primaryColor,
        //     onPressed: () {
        //       statusManager.toggleStatus();
        //       Get.snackbar(
        //         'Status',
        //         'Status set to ${statusController.status.toString() ?? 'Not set'}',
        //         backgroundColor: Colors.green,
        //         colorText: Colors.black,
        //         snackPosition: SnackPosition.BOTTOM,
        //       );
        //     },
        //   ),
        // ],
      ),
      body: Center(
        child: SingleChildScrollView(
          //reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                // -- header text
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Enter your profile data',
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              buildUsernameTextField(),
              SizedBox(
                height: 5.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              buildPasscode(),
              SizedBox(
                height: 5.0,
              ),
              buildCourseDropdown(),
              SizedBox(
                height: 5.0,
              ),
              buildProfileDropdown(),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: GestureDetector(
                  onTap: () {
                    statusManager.storeStatus('registered');
                    // -- Harvest User object data
                    _user.username = usernameController.text ?? 'Not set';
                    _user.passcode = passcodeController.text ?? 'Not set';
                    _user.course = _chosenCourse ?? '2 Year Extended Diploma 1080 Hours';
                    _user.target = _chosenProfile ?? 'PPP';
                    // -- Persist the user object data
                    userManager.storeUser(_user);

                    Get.snackbar(
                      'Status',
                      'Status set to ${statusController.status.toString() ?? 'Not set'}',
                      backgroundColor: Colors.green,
                      colorText: Colors.black,
                      snackPosition: SnackPosition.BOTTOM,
                    );

                    Get.toNamed('/switchboard');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 60.0),
                    alignment: Alignment.center,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      'Store Profile Data',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                      title: 'Are you sure?',
                      content: Text('This action will clear all credential and grades stored data'),
                      backgroundColor: Colors.yellow,
                      textCancel: 'No',
                      textConfirm: 'Yes',
                      confirmTextColor: Colors.white,
                      barrierDismissible: true,
                      onCancel: () {},
                      onConfirm: () {
                        userManager.clearUser();
                        //defaultDataManager.setDefaultUserData();
                        defaultDataManager.setDefaultGradesData();
                        Get.toNamed('/');
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 60.0),
                    alignment: Alignment.center,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      'Reset ALL data',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCourseDropdown() => Container(
        child: DropdownWrapper(
          acLabel: 'Course',
          flexValue1: 2,
          flexValueChild: 5,
          wrapperChild: DropdownControl(
            hintText: 'Choose your course',
            valueSetter: _chosenCourse,
            items: getCourseDropdownItems(),
            onChange: (newValue) {
              setState(() {
                this._chosenCourse = newValue;
              });
            },
          ),
        ),
      );

  // -- custom controls

  Widget buildProfileDropdown() => Container(
        child: DropdownWrapper(
          acLabel: 'Target',
          flexValue1: 2,
          flexValueChild: 5,
          wrapperChild: DropdownControl(
            hintText: 'Choose your target profile',
            valueSetter: _chosenProfile,
            items: getProfileDropdownItems(),
            onChange: (newValue) {
              setState(() {
                this._chosenProfile = newValue;
              });
            },
          ),
        ),
      );

  Widget buildUsernameTextField() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: TextField(
        controller: usernameController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: 'Username',
          hintText: 'Enter a username',
          prefixIcon: Icon(Icons.person),
          suffixIcon: usernameController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => usernameController.clear(),
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        textInputAction: TextInputAction.done,
        //keyboardType: TextInputType.emailAddress,
      ));

  Widget buildPasscode() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: TextField(
          controller: passcodeController,
          decoration: InputDecoration(
            hintText: 'Enter a passcode number',
            prefixIcon: Icon(Icons.lock),
            labelText: 'Passcode',
            //errorText: 'Passcode is wrong',
            suffixIcon: IconButton(
              icon: isPasscodeVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              onPressed: () => setState(() => isPasscodeVisible = !isPasscodeVisible),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          obscureText: isPasscodeVisible,
          keyboardType: TextInputType.number,
        ),
      );
}
