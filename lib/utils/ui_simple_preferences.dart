import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences _preferences;

  static const _keyUsername = 'username';
  static const _keyPin = 'pin';
  static const _keyCourse = 'course';
  static const _keyProfile = 'profile';
  static const _keyRegistered = 'registered';
  static const _keyA1Grade = 'a1Grade';
  static const _keyA2Grade = 'a2Grade';
  static const _keyB1Grade = 'b1Grade';
  static const _keyB2Grade = 'b2Grade';

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username) async => await _preferences.setString(_keyUsername, username);

  static String getUsername() => _preferences.getString(_keyUsername);

  static Future setPin(String pin) async => await _preferences.setString(_keyPin, pin);

  static String getPin() => _preferences.getString(_keyPin);

  static Future setCourse(String course) async => await _preferences.setString(_keyCourse, course);

  static String getCourse() => _preferences.getString(_keyCourse);

  static Future setProfile(String profile) async => await _preferences.setString(_keyProfile, profile);

  static String getProfile() => _preferences.getString(_keyProfile);

  static Future setRegistered(String registered) async => await _preferences.setString(_keyRegistered, registered);

  static String getRegistered() => _preferences.getString(_keyRegistered);

  // -- Grades records for units A1, A2, B1, B2
  static Future setA1(String a1Grade) async => await _preferences.setString(_keyA1Grade, a1Grade);

  static String getA1() => _preferences.getString(_keyA1Grade);

  static Future setA2(String a2Grade) async => await _preferences.setString(_keyA2Grade, a2Grade);

  static String getA2() => _preferences.getString(_keyA2Grade);

  // -- Year 2
  static Future setB1(String b1Grade) async => await _preferences.setString(_keyB1Grade, b1Grade);

  static String getB1() => _preferences.getString(_keyB1Grade);

  static Future setB2(String b2Grade) async => await _preferences.setString(_keyB2Grade, b2Grade);

  static String getB2() => _preferences.getString(_keyB1Grade);
}
