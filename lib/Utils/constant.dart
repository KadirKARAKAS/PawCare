import 'package:flutter/foundation.dart';

ValueNotifier<int> valueNotifierX = ValueNotifier(0);
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
int vaccinationSelectedIndex = 0;
int treatmentSelectedIndex = 0;
int petDetailPageIndex = 0;
String selectedDocID = "";
