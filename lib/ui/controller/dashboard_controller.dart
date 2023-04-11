import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  int _isSelected = 1;

  int get isSelected => _isSelected;

  set isSelected(int value) {
    _isSelected = value;
    update();
  }

  List<IconData> bottomIconList = [Icons.person, Icons.home, Icons.settings];
}
