import 'package:flutter/material.dart';
import 'package:kayla/view/home_page/homewidget/homewidget.dart';

class AddorEditController extends ChangeNotifier {
  List<DropdownMenuItem<String>> districtItems = [
    DropdownMenuItem(
        value: 'Alappuzha', child: textwidget.text(data: 'Alappuzha')),
    DropdownMenuItem(
        value: 'Ernakulam', child: textwidget.text(data: 'Ernakulam')),
    DropdownMenuItem(value: 'Idukki', child: textwidget.text(data: 'Idukki')),
    DropdownMenuItem(value: 'Kannur', child: textwidget.text(data: 'Kannur')),
    DropdownMenuItem(
        value: 'Kasaragod', child: textwidget.text(data: 'Kasaragod')),
    DropdownMenuItem(value: 'Kollam', child: textwidget.text(data: 'Kollam')),
    DropdownMenuItem(
        value: 'Kottayam', child: textwidget.text(data: 'Kottayam')),
    DropdownMenuItem(
        value: 'Kozhikode', child: textwidget.text(data: 'Kozhikode')),
    DropdownMenuItem(
        value: 'Malappuram', child: textwidget.text(data: 'Malappuram')),
    DropdownMenuItem(
        value: 'Palakkad', child: textwidget.text(data: 'Palakkad')),
    DropdownMenuItem(
        value: 'Pathanamthitta',
        child: textwidget.text(data: 'Pathanamthitta')),
    DropdownMenuItem(
        value: 'Thiruvananthapuram',
        child: textwidget.text(
          data: 'Trivandrum',
        )),
    DropdownMenuItem(
        value: 'Thrissur', child: textwidget.text(data: 'Thrissur')),
    DropdownMenuItem(value: 'Wayanad', child: textwidget.text(data: 'Wayanad')),
  ];
}
