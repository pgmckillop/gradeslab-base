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
import './pages/page_info.dart';
import './pages/page_about.dart';

// Data models
import './models/unit_grade.dart';
import './models/flags.dart';

// Get storage controllers
import './controllers/status_controller.dart';
import './controllers/user_controller.dart';

// Data managers
import './utils/default_data.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // -- Initialize storage components
  await Hive.initFlutter();
  // -- Register the Hive adapters
  Hive.registerAdapter(UnitGradeAdapter());
  Hive.registerAdapter(FlagsAdapter());
  // -- initialise the boxes
  await Hive.openBox<UnitGrade>('gradesBox');
  await Hive.openBox<Flags>('flagsBox');

  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
    setDataDefaults();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
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
        GetPage(
          name: '/info',
          page: () => PageInfo(),
        ),
        GetPage(
          name: '/about',
          page: () => PageAbout(),
        ),
      ],
      home: PageLogin(),
    );
  }

  void setDataDefaults() {
    bool firstUse = false;

    firstUse = statusController.status.toString() == 'unregistered';
    DefaultData defaultDataManager = DefaultData();

    if (firstUse) {
      print('Currently unregistered');
      // -- set data defaults here
      defaultDataManager.setDefaultUserData();
      defaultDataManager.setDefaultGradesData();
    } else {
      print('Currently registered');
    }
  }
}
