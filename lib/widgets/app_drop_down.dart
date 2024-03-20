import 'package:flutter/material.dart';

class AppCustomDropDown extends StatelessWidget {
  const AppCustomDropDown({
    super.key,
    required this.onChanged,
    this.selectedValue,
    this.fieldLabel,
    required this.dropDownData,
  });

  final String? fieldLabel;
  final List<dynamic> dropDownData;
  final Function(String value) onChanged;
  final String? selectedValue;

  showDropDown(BuildContext context) async {
    final value = await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(20, 170, 20, 100),
      items: [
        ...dropDownData.map(
          (e) => PopupMenuItem(
            value: e,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(e),
            ),
          ),
        )
      ],
    );
    if (value != null) {
      onChanged(value.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldLabel ?? "Select an Option",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(),
          ),
          child: InkWell(
            onTap: () {
              showDropDown(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedValue ?? "Select a value",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
