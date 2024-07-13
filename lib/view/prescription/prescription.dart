import 'package:flutter/material.dart';
import 'package:kayla/view/home_page/homewidget/homewidget.dart';

class Prescription extends StatelessWidget {
  const Prescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: textwidget.text(data: "P R E S C R I P T I O N"),
      ),
    );
  }
}
