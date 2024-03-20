import 'package:assesment/model/json_to_form_model.dart';
import 'package:assesment/provider/form_provider.dart';
import 'package:assesment/widgets/app_drop_down.dart';
import 'package:assesment/widgets/app_text_field.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FormScreen extends HookConsumerWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formController = ref.watch(formProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Screen"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            ...formController.formData.mapIndexed(
              (index, e) => Visibility(
                visible: formController.checkFieldVisibility(
                    widget: formController.formData[index].formWidget,
                    visibleLogic: formController.formData[index].visibleLogic,
                    dropDownSelectedData: formController.formData
                        .map(
                          (e) => "${e.fieldName}=='${e.fieldValue}'",
                        )
                        .toList()),
                child: FormWidgetCard(
                  formData: e,
                  setValue: (value) {
                    formController.updateFieldValue(
                      index: index,
                      value: value,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Row()
          ],
        ),
      ),
    );
  }
}

class FormWidgetCard extends StatelessWidget {
  const FormWidgetCard({
    required this.formData,
    required this.setValue,
    super.key,
  });
  final JsonToFormModel formData;
  final Function(String value) setValue;
  @override
  Widget build(BuildContext context) {
    if (formData.formWidget == FormWidget.textField) {
      return AppTextField(
        fieldLabel: formData.fieldName ?? "",
        onChanged: setValue,
      );
    } else if (formData.formWidget == FormWidget.dropdown) {
      return AppCustomDropDown(
        onChanged: setValue,
        fieldLabel: formData.fieldName ?? "",
        dropDownData: formData.values,
        selectedValue: formData.fieldValue,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
