// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class textFormField {
  textformfield({
    controller,
    labeltext,
    onchange,
    String? type,
    keytype,
    max,
    color,
  }) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter $labeltext";
        } else if (type == 'name') {
          if (value.length != 10) {
            return "Please Enter Valid Phone Number";
          }
        } else if (type == "firstName") {
          if (value.isEmpty) {
            return "please enter a name";
          }
        }
        return null;
      },
      maxLength: max,
      keyboardType: keytype,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        labelText: labeltext,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.grey.withOpacity(.15),
      ),
      onChanged: (value) {
        onchange;
      },
    );
  }
}
