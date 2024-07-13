import 'package:flutter/material.dart';
import 'package:kayla/controller/addoreditcontroller/addoreditcontroller.dart';
import 'package:kayla/controller/bottomcontroller/bottomcontroller.dart';
import 'package:kayla/view/bottombar/bottombar.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddorEditController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomBar(),
      ),
    );
  }
}
