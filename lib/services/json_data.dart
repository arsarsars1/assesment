/* ****    Note, i assume wherever the json data is coming from,
           it will be decoded and we can always have a Map<String,dynamic> data type
 */
List<Map<String, dynamic>> testJsonData = [
  {
    "field_name": "f1",
    "widget": "dropdown",
    "valid_values": ["A", "B"]
  },
  {"field_name": "f2", "widget": "textfield", "visible": "f1=='A'"},
  {"field_name": "f3", "widget": "textfield", "visible": "f1=='A'"},
  {"field_name": "f4", "widget": "textfield", "visible": "f1=='A'"},
  {"field_name": "f5", "widget": "textfield", "visible": "f1=='B'"},
  {"field_name": "f6", "widget": "textfield", "visible": "f1=='B'"},
];
