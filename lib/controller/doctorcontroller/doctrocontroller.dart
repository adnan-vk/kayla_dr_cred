import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kayla/model/doctormodel.dart';
import 'package:kayla/service/doctorservice.dart';

class DoctorController extends ChangeNotifier {
  String? district;
  String? gender;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  DoctorService doctorservice = DoctorService();
  getAllDoctors() async {
    try {
      await doctorservice.getAllDoctors();
      notifyListeners();
      log("fetched all doctors");
    } catch (e) {
      log("error in fetching data : $e");
    }
  }

  addDoctor(DoctorModel data) async {
    try {
      await doctorservice.addDoctor(data);
      getAllDoctors();
    } catch (e) {
      log("error in adding data : $e");
    }
  }

  clearControllers() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    notifyListeners();
  }
}
