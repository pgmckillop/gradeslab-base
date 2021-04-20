import 'package:flutter/material.dart';
import '../widgets/dropdown_wrapper.dart';
import '../widgets/dropdown_control.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/status_controller.dart';
import '../utils/status_manager.dart';
import '../utils/user_manager.dart';

import '../models/user.dart';

import '../uidata/course_data.dart';

class PageSettings extends StatefulWidget {
  @override
  _PageSettingsState createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  String _chosenCourse;
  String _chosenProfile;
  String _username = '';
  String _passcode = '';

  bool isPasscodeVisible = false;

  // -- TextField Controllers
  final usernameController = TextEditingController();
  final passcodeController = TextEditingController();

  var storage = GetStorage();
  User _user = User();

  StatusManager statusManager = StatusManager();
  UserManager userManager = UserManager();

  StatusController statusController = Get.find<StatusController>();

  @override
  void initState() {
    usernameController.addListener(() => setState(() {}));
    usernameController.text = storage.read('username').toString() ?? '';
    _username = storage.read('username').toString() ?? '';
    passcodeController.text = storage.read('passcode').toString() ?? '';
    //_chosenCourse = storage.read('course').toString() ?? ''; // -- THIS CAUSES THE DROPDOWN CRASH
    //_chosenProfile = storage.read('target').toString() ?? ''; //-- DITTO

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'SETTINGS',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
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
                    Get.snackbar(
                      'Status',
                      'Status set to ${statusController.status.toString()}',
                      backgroundColor: Colors.green,
                      colorText: Colors.black,
                      snackPosition: SnackPosition.BOTTOM,
                    );
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
                      'Submit Profile Data',
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
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 60.0),
                    alignment: Alignment.center,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      'Reset profile data',
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
          onChanged: (value) => {setState(() => this._passcode = value), passcodeController.text = value},
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
