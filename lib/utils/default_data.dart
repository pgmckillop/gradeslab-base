import '../utils/status_manager.dart';
import '../utils/user_manager.dart';
import '../models/user.dart';
import '../utils/grades_manager.dart';

var statusManager = StatusManager();
var userManager = UserManager();
var user = User();

class DefaultData {
  //-- set defaults
  void setDefaultUserData() {
    statusManager.storeStatus('unregistered');

    user.username = '';
    user.passcode = '';
    user.course = '2 Year Extended Diploma 1080 Hours';
    user.target = 'PPP';

    userManager.storeUser(user);

    print('Default user data stored');
  }

  void setDefaultGradesData() {
    // -- Default unit grades
    String pd = 'PD Pass Default';

    GradesManager gradesManager = GradesManager();
    gradesManager.addGrade('A1', 'A1 Skills Development', pd, pd, pd, pd, pd);

    gradesManager.addGrade('A2', 'A2 Creative Project', pd, pd, pd, pd, pd);

    gradesManager.addGrade('B1', 'B1 Personal Progression', pd, pd, pd, pd, pd);

    gradesManager.addGrade('B2', 'B2 Industry Response', pd, pd, pd, pd, pd);
  }
}
