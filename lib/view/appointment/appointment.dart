import 'package:flutter/material.dart';
import 'package:kayla/view/home_page/homewidget/homewidget.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: textwidget.text(data: "A P P O I N T M E N T"),
      ),
    );
  }
}
