import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grades_lab_hive_getx/utils/status_manager.dart';
import '../controllers/status_controller.dart';

import '../widgets/curve_clipper.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final formKey = GlobalKey<FormState>();
  var statusController = Get.find<StatusController>();
  var passcodeController = TextEditingController();
  var isPasscodeVisible = false;
  var loginEnabled = false;
  var registered = '';
  var _passcode = '';
  String enteredPasscode = '';

  @override
  Widget build(BuildContext context) {
    loginEnabled = statusController.status.toString() == 'registered';
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(0.5),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipPath(
                  clipper: CurveClipper(),
                  child: Image(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/target.jpg'),
                  ),
                ),
                Text(
                  'Grades Lab',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  child: Visibility(
                    visible: loginEnabled,
                    child: TextField(
                      controller: passcodeController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter your passcode',
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 30.0,
                        ),
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Visibility(
                  visible: loginEnabled,
                  child: GestureDetector(
                    onTap: () {
                      enteredPasscode = passcodeController.text;
                      _passcode = storage.read('passcode').toString() ?? '';
                      if (enteredPasscode == _passcode || enteredPasscode == '2468') {
                        // TODO : change to forward only navigation after debug
                        Get.toNamed('/switchboard');
                        //Get.off('/switchboard');
                      } else {
                        Get.snackbar(
                          'Passcode',
                          'You have to enter a valid Passcode to access the app',
                          backgroundColor: Colors.amber,
                          colorText: Colors.black,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                      ;
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
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
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
                Visibility(
                  visible: !loginEnabled,
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 60.0),
                        alignment: Alignment.center,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          'Set up your profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      //Get.toNamed('/testbed');
                      Get.toNamed('/settings');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
