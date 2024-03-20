# Abdul Rehman assessment
## Overview

This Flutter application is developed as part of the Flutter Dynamic Form Builder Task. The objective of this task is to create an application capable of dynamically generating and displaying a form based on JSON input. The form's field visibility changes according to user selections, guided by visibility rules defined within the JSON. The application adapts to any modifications in the JSON structure.

## JSON Structure

The application accepts JSON input that defines the form fields, their types, valid values (for dropdowns), and visibility conditions. Below is an example of the expected JSON format:

```json
[
  {
    "field_name": "f1",
    "widget": "dropdown",
    "valid_values": ["A", "B"]
  },
  {
    "field_name": "f2",
    "widget": "textfield",
    "visible": "f1=='A'"
  },
  {
    "field_name": "f3",
    "widget": "textfield",
    "visible": "f1=='A'"
  },
  {
    "field_name": "f4",
    "widget": "textfield",
    "visible": "f1=='A'"
  },
  {
    "field_name": "f5",
    "widget": "textfield",
    "visible": "f1=='B'"
  },
  {
    "field_name": "f6",
    "widget": "textfield",
    "visible": "f1=='B'"
  }
]
```


## Key Features

- **Dynamic Form Generation:** The app dynamically creates dart model which in turns are used to render form fields based on the provided JSON input.

- **Conditional Visibility:** Fields are shown or hidden based on the conditions specified in the "visible" attribute of the JSON. These conditions evaluate based on the user's input.

- **State Management:** Riverpod is the state management tool used for managing the state of the form, including the visibility and values of the fields.

- **Widget Build Optimization:**  The Flutter build mechanism rebuilds only widgets that are necessary based on user interaction and changes in visibility conditions.

## Technical Considerations

- **Error Handling:** for a malformed or json data that doesn't meet the requirement, the model that convert json to dart model handles this as there won't be a form data if the json doesn't have the specified keys that translates to form data

- **Extensibility:** The Solution i have here handles all scenerios the form can come and will render appropriately.
