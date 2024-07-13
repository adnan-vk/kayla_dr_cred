import 'package:flutter/material.dart';
import 'package:kayla/view/home_page/homewidget/homewidget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: textwidget.text(data: "P R O F I L E"),
      ),
    );
  }
}
