// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class textFormField {
  textformfield(
      {controller,
      cnfcontroller,
      labeltext,
      onchange,
      validator,
      String? type,
      keytype,
      max,
      minline,
      color,
      maxline,
      icon,
      bool obsc = false}) {
    // TextEditingController cnfcontroller = TextEditingController();
    return TextFormField(
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return "Please enter $hinttext";
      //   } else if (type == 'phone') {
      //     if (value.length != 10) {
      //       return "Please Enter Valid Phone Number";
      //     }
      //   } else if (type == "firstName") {
      //     if (value.isEmpty) {
      //       return "please enter a name";
      //     }
      //   }
      //   return null;
      // },
      obscureText: obsc,
      maxLines: maxline,
      minLines: minline,
      maxLength: max,
      keyboardType: keytype,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        labelText: labeltext,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.grey.withOpacity(.15),
        prefixIcon: icon,
      ),
      onChanged: (value) {
        onchange;
      },
    );
  }
}
