class JsonToFormModel {
  String? fieldName;
  String? fieldValue;
  FormWidget? formWidget;
  List<String> values = [];
  String? visibleLogic;

  JsonToFormModel.fromJson({required Map<String, dynamic> data}) {
    fieldName = data["field_name"];
    formWidget = convertStringToFormWidget(data["widget"]);
    if (formWidget == FormWidget.dropdown) {
      values = data["valid_values"];
    }
    if (data.containsKey("visible")) {
      visibleLogic = data["visible"];
    }
  }

  @override
  String toString() {
    return {
      "fieldName": fieldName,
      "fieldValue": fieldValue,
      "formWidget": formWidget,
      "values": values,
      "visibleLogic": visibleLogic
    }.toString();
  }
}

enum FormWidget { dropdown, textField, unknown }

FormWidget convertStringToFormWidget(String? value) {
  if (value == null) {
    return FormWidget.unknown;
  }
  switch (value.toLowerCase()) {
    case "dropdown":
      return FormWidget.dropdown;
    case "textfield":
      return FormWidget.textField;
    default:
      return FormWidget.unknown;
  }
}
