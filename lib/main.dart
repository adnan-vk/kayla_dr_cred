import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kayla/controller/addoreditcontroller/addoreditcontroller.dart';
import 'package:kayla/controller/bottomcontroller/bottomcontroller.dart';
import 'package:kayla/controller/doctorcontroller/doctrocontroller.dart';
import 'package:kayla/controller/homecontroller/homecontroller.dart';
import 'package:kayla/firebase_options.dart';
import 'package:kayla/view/bottombar/bottombar.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomBar(),
      ),
    );
  }
}
