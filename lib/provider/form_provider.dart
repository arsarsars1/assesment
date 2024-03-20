import 'package:assesment/model/json_to_form_model.dart';
import 'package:assesment/services/json_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final formProvider = ChangeNotifierProvider<FormNotifier>((ref) {
  return FormNotifier(ref);
});

class FormNotifier extends ChangeNotifier {
  final Ref ref;
  FormNotifier(this.ref);

  List<JsonToFormModel> formData =
      testJsonData.map((e) => JsonToFormModel.fromJson(data: e)).toList();

  updateFieldValue({required int index, required String value}) {
    formData[index].fieldValue = value;
    notifyListeners();
  }

  bool checkFieldVisibility(
      {String? visibleLogic,
      required List<String> dropDownSelectedData,
      FormWidget? widget}) {
    if (visibleLogic == null && widget == FormWidget.dropdown) {
      return true;
    } else {
      if (dropDownSelectedData.contains(visibleLogic)) {
        return true;
      }
    }
    return false;
  }
}
