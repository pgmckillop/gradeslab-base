import 'package:flutter/material.dart';
import '../components/constants.dart';
import 'package:get/get.dart';
import '../widgets/curve_clipper.dart';
import '../utils/user_manager.dart';
import '../utils/url_manager.dart';

class PageSwitchboard extends StatelessWidget {
  var userManager = UserManager();
  var urlManager = UrlManager();
  var courseHomepage =
      'https://qualifications.pearson.com/en/qualifications/btec-nationals/btec-nat-creative-media-practice.html';
  var collegeHomepage = 'http://iwcollege.ac.uk/';
  var currentUsername = '';

  @override
  Widget build(BuildContext context) {
    currentUsername = userManager.currentUserUsername().toString();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'OPTIONS',
          style: kAppBarTextStyle,
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.blue),
              textTheme: TextTheme().apply(bodyColor: Colors.blue),
            ),
            child: PopupMenuButton<int>(
              color: Colors.blue,
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text('Settings'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text('BTEC website'),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text('College website'),
                ),
                PopupMenuItem<int>(
                  value: 4,
                  child: Text('UCAS Tariff'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text('About the App'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(0.5),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // ClipPath(
              //   clipper: CurveClipper(),
              //   child: Image(
              //     height: MediaQuery.of(context).size.height / 2.5,
              //     width: double.infinity,
              //     fit: BoxFit.cover,
              //     image: AssetImage('assets/images/choice.jpg'),
              //   ),
              // ),
              buildHeadImage(context),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Hello $currentUsername',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/current');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 60.0),
                      alignment: Alignment.center,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Current Grades',
                        style: TextStyle(
                            color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600, letterSpacing: 1.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/target');
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 60.0),
                      alignment: Alignment.center,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Target Grades',
                        style: TextStyle(
                            color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600, letterSpacing: 1.5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Get.toNamed('/settings');
        break;

      case 1:
        UrlManager.openLink(
            url:
                'https://qualifications.pearson.com/en/qualifications/btec-nationals/btec-nat-creative-media-practice.html');
        break;

      case 2:
        UrlManager.openLink(url: "https://iwcollege.ac.uk/");
        break;

      case 3:
        Get.toNamed('/about');
        break;

      case 4:
        UrlManager.openLink(url: 'https://www.ucas.com/ucas/tariff-calculator');
        break;
    }
  }

  Widget buildHeadImage(BuildContext context) => ClipPath(
        clipper: CurveClipper(),
        child: Image(
          height: MediaQuery.of(context).size.height / 3.0,
          width: double.infinity,
          fit: BoxFit.fill,
          image: AssetImage('assets/images/choice.jpg'),
        ),
      );
}
