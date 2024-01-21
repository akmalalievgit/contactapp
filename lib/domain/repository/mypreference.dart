import 'dart:convert';

import 'package:contact_app/data/contact_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPreference {
  static late final SharedPreferences pref;

  static void innitPref() async {
    pref = await SharedPreferences.getInstance();
  }

  static bool getLogin() {
    return pref.getBool("login") ?? false;
  }

  static void editUserData( ContactData userData, String oldName) async {
    List<String> existingData = pref.getStringList('contacts_${pref.getString("name")}') ?? [];
    for(int i = 0; i < existingData.length; i++){
      if(existingData[i].split(',').first == oldName){
        existingData[i] = userData.toCustomString();
        await pref.setStringList('contacts_${pref.getString("name")}', existingData);
      }
    }
  }
  static bool register(String name, String password) {
    if (!pref.containsKey(name)) {
      pref.setString(name, password);
      pref.setString("username", name);
      pref.setBool("login", true);
    } else {
      return false;
    }
    return true;
  }

  static bool login(String name, String password) {
    if (pref.containsKey(name) && pref.getString(name) == password) {
      pref.setBool("login", true);
      pref.setString("username", name);
      return true;
    }
    return false;
  }

  static bool unregister() {
    pref.remove(pref.getString("name") ?? "");
    return true;
  }

  static void logout() {
    pref.setBool("login", false);
  }

  static void addContact(ContactData userData) async {
    List<String> existingData =
        pref.getStringList('contacts_${pref.getString("name")}') ?? [];
    existingData.add(userData.toCustomString());
    await pref.setStringList('contacts_${pref.getString("name")}', existingData);
  }

  static void deleteContact(String contactName) async {
    List<String> existingData = pref.getStringList('contacts_${pref.getString("name")}') ?? [];
    for(int i = 0; i < existingData.length; i++){
      if(existingData[i].split(',').first == contactName){
        existingData.removeAt(i);
        await pref.setStringList('contacts_${pref.getString("name")}', existingData);
      }
    }
  }

  static Future<List<ContactData>> getUserList() async {
    List<String>? userStringList =
        pref.getStringList('contacts_${pref.getString("name")}');
    return userStringList
            ?.map((str) => ContactData.fromCustomString(str))
            .toList() ??
        [];
  }
}
