import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// -- internal components
import './pages/page_admin.dart';
import './pages/page_current.dart';
import './pages/page_edit_grade.dart';
import './pages/page_login.dart';
import './pages/page_settings.dart';
import './pages/page_switchboard.dart';
import './pages/page_target.dart';
import './pages/page_testbed.dart';

import './models/unit_grade.dart';

import './controllers/status_controller.dart';
import './controllers/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // -- Initialize storage components
  await Hive.initFlutter();

  Hive.registerAdapter(UnitGradeAdapter());
  await Hive.openBox<UnitGrade>('gradesBox');

  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Initialise the controllers
  StatusController statusController = Get.put(
    StatusController(),
  );

  UserDataController userDataController = Get.put(
    UserDataController(),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      // - Named routes
      getPages: [
        GetPage(
          name: '/',
          page: () => MyApp(),
        ),
        GetPage(
          name: '/admin',
          page: () => PageAdmin(),
        ),
        GetPage(
          name: '/current',
          page: () => PageCurrent(),
        ),
        GetPage(
          name: '/edit',
          page: () => PageEditGrade(),
        ),
        GetPage(
          name: '/login',
          page: () => PageLogin(),
        ),
        GetPage(
          name: '/settings',
          page: () => PageSettings(),
        ),
        GetPage(
          name: '/switchboard',
          page: () => PageSwitchboard(),
        ),
        GetPage(
          name: '/target',
          page: () => PageTarget(),
        ),
        GetPage(
          name: '/testbed',
          page: () => PageTestbed(),
        ),
      ],
      home: PageLogin(),
    );
  }
}
