import 'package:flutter/material.dart';
import 'package:kayla/controller/doctorcontroller/doctorcontroller.dart';
import 'package:kayla/view/add/add.dart';
import 'package:kayla/view/home_page/homewidget/homewidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<DoctorController>(context, listen: false);
    pro.getAllDoctors();
    return Scaffold(
      appBar: HomeWidget().topBar(context),
      body: Consumer<DoctorController>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.filteredDoctor.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(7),
              child: HomeWidget().doctorCard(context, index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF019744),
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Add(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
