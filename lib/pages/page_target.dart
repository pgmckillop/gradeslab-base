import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grades_lab_hive_getx/components/constants.dart';
import 'package:grades_lab_hive_getx/uidata/course_data.dart';
import 'package:grades_lab_hive_getx/widgets/dropdown_control.dart';
import 'package:grades_lab_hive_getx/widgets/dropdown_wrapper.dart';
import '../utils/user_manager.dart';
import '../utils/target_validator.dart';

import '../models/user.dart';
import '../models/target_state.dart';

class PageTarget extends StatefulWidget {
  @override
  _PageTargetState createState() => _PageTargetState();
}

class _PageTargetState extends State<PageTarget> {
  String _profile;
  String _ucas;
  String _storedProfile;

  final String _canMeetTitle = 'Brilliant';
  final String _cannotMeetTitle = 'Not so good';

  var storage = GetStorage();
  User _user = User();
  UserManager userManager = UserManager();
  TargetValidator targetValidator = TargetValidator();
  TargetState targetState = TargetState();

  @override
  void initState() {
    _user = userManager.currentUser();
    _profile = storage.read('target').toString() ?? '';
    _ucas = profile1080ToUcas(_profile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _storedProfile = storage.read('target').toString();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
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
          'TARGETS',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_to_home_screen,
              color: Colors.blue,
            ),
            onPressed: () {
              Get.toNamed('/explanation');
            },
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your Current Target: $_storedProfile',
                style: kPageHeaderTextStyle,
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Image(
                  height: MediaQuery.of(context).size.height / 6.0,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/bulls-eye.png'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              Text(
                'Check out UCAS Points of Profiles',
                style: kPageHeaderTextStyle,
              ),
              Text('This will show the equivalent of the selected item'),
              SizedBox(
                height: 20.0,
              ),
              buildProfileDropdown(),
              SizedBox(
                height: 10.0,
              ),
              build1080UcasBandsDropdown(),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    int available = targetValidator.totalAvailablePoints();
                    int target = targetValidator.getTargetPoints(_profile);
                    int difference = available - target;
                    int gap = target - available;

                    targetState.pointsDifference = gap;

                    if (available >= target) {
                      targetState.status = 'can_meet';
                      Get.snackbar(
                        _canMeetTitle,
                        'You can get there and have an excess of $difference points',
                        backgroundColor: Colors.green,
                        colorText: Colors.black,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      targetState.status = 'cannot_meet';
                      Get.snackbar(
                        _cannotMeetTitle,
                        'You cannot get there because you are short $gap points',
                        backgroundColor: Colors.amber,
                        colorText: Colors.black,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 60.0),
                    alignment: Alignment.center,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Text(
                      'Can I get there?',
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
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    // TODO: Remove debug print
                    //print('set target clicked');
                    storage.write('target', _profile);
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
                    child: const Text(
                      'Set as my target',
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
              //buildStoreSelectedProfile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileDropdown() => Container(
        child: DropdownWrapper(
          acLabel: 'Profile',
          flexValue1: 2,
          flexValueChild: 5,
          wrapperChild: DropdownControl(
            hintText: 'Choose your grade',
            valueSetter: _profile,
            items: get1080ProfileDropdownItems(),
            onChange: (newValue) {
              setState(() {
                this._profile = newValue;
                this._ucas = profile1080ToUcas(newValue);
              });
            },
          ),
        ),
      );

  Widget build1080UcasBandsDropdown() => Container(
        child: DropdownWrapper(
          acLabel: 'UCAS',
          flexValue1: 2,
          flexValueChild: 5,
          wrapperChild: DropdownControl(
            hintText: 'Choose your band',
            valueSetter: _ucas,
            items: get1080UcasDropdownItems(),
            onChange: (newValue) {
              setState(() {
                this._ucas = newValue;
                this._profile = ucas1080ToProfile(newValue);
              });
            },
          ),
        ),
      );
}
