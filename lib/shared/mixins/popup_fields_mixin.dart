import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

mixin PopupFieldsMixin {
  TextEditingController periodNameValue = TextEditingController();
  MaskedTextController periodStartValue =
      MaskedTextController(mask: '00/00/0000');
  MaskedTextController periodFinishedValue =
      MaskedTextController(mask: '00/00/0000');
  TextEditingController periodGoalOneValue = TextEditingController();
  TextEditingController periodGoalTwoValue = TextEditingController();

  void disposeTec() {
    periodNameValue.dispose();
    periodStartValue.dispose();
    periodFinishedValue.dispose();
    periodGoalOneValue.dispose();
    periodGoalTwoValue.dispose();
  }
}
