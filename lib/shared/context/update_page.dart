import 'package:flutter/material.dart';

class UpdatePage with ChangeNotifier {
  bool isUpdated = false;

  void getUpdatePage() {
    isUpdated = !isUpdated;
    notifyListeners();
  }
}
