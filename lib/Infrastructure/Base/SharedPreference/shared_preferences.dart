// import 'dart:ffi';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LocalStorage {
//
//   /// Write data
//
//   addStringToSF(String? Key, String? value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(Key!, value!);
//   }
//
//   addIntToSF(String? Key, int? value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt('intValue', 123);
//   }
//
//   addDoubleToSF(String? Key, Double? value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setDouble('doubleValue', 115.0);
//   }
//
//   addBoolToSF(String? Key, bool? value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool(Key!, value! );
//   }
//
//   /// Read data
//
//   getStringValuesSF(String? Key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     String? stringValue = prefs.getString(Key!);
//     return stringValue;
//   }
//   getBoolValuesSF(String Key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return bool
//     bool? boolValue = prefs.getBool(Key);
//     return boolValue;
//   }
//   getIntValuesSF(String? Key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return int
//     int? intValue = prefs.getInt(Key!);
//     return intValue;
//   }
//   getDoubleValuesSF(String? Key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return double
//     double? doubleValue = prefs.getDouble(Key!);
//     return doubleValue;
//   }
//
//   /// Remove data
//
//   removeValues(String? Key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Remove String
//     prefs.remove(Key!);
//     //Remove bool
//     prefs.remove(Key);
//   }
// }