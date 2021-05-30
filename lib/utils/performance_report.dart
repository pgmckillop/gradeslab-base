import 'package:grades_lab_hive_getx/models/profile.dart';

class PerformanceReport {
  // -- Calculate profile information from points earned
  Profile getProfile(int points) {
    String gradeProfile = '';
    int ucasEarned = 0;

    if (points < 30) {
      gradeProfile = 'UUU';
      ucasEarned = 0;
    } else if (points < 36) {
      gradeProfile = 'PPP';
      ucasEarned = 48;
    } else if (points < 42) {
      gradeProfile = 'MPP';
      ucasEarned = 64;
    } else if (points < 50) {
      gradeProfile = 'MMP';
      ucasEarned = 80;
    } else if (points < 58) {
      gradeProfile = 'MMM';
      ucasEarned = 96;
    } else if (points < 64) {
      gradeProfile = 'DMM';
      ucasEarned = 112;
    } else if (points < 70) {
      gradeProfile = 'DDM';
      ucasEarned = 128;
    } else if (points < 74) {
      gradeProfile = 'DDD';
      ucasEarned = 144;
    } else if (points < 80) {
      gradeProfile = 'D*DD';
      ucasEarned = 152;
    } else if (points < 85) {
      gradeProfile = 'D*D*D';
      ucasEarned = 160;
    } else {
      gradeProfile = 'D*D*D*';
      ucasEarned = 168;
    }

    Profile currentProfile = Profile(gradeProfile, points, ucasEarned);

    return currentProfile;
  }
}
