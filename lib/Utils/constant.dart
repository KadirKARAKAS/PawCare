import 'package:flutter/foundation.dart';

List<Map<String, dynamic>> getdataList = [];
List<Map<String, dynamic>> dailyToDoList = [];
List<Map<String, dynamic>> petsVaccinationList = [];
List<Map<String, dynamic>> petsTreatmentList = [];

String petsType = "";
bool petsTypeIconBool = false;
String imageURLL = "";
bool circleBool = false;
bool iconVisiable = false;
int selectedIndex = 0;
ValueNotifier<int> valueNotifierX = ValueNotifier(0);
int vaccinationSelectedIndex = 0;
