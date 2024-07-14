import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kayla/model/doctormodel.dart';
import 'package:kayla/service/doctorservice.dart';

class DoctorController extends ChangeNotifier {
  String? imageUrl = "";
  final ImagePicker imagePicker = ImagePicker();
  File? selectedimage;
  bool isloading = false;
  String? genderselect;
  String? districtselect;
  String? district;
  String? gender;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  DoctorService doctorservice = DoctorService();
  List<DoctorModel> allDoctors = [];
  List<DoctorModel> filteredDoctor = [];
  getAllDoctors() async {
    try {
      allDoctors = await doctorservice.getAllDoctors();
      log("message");
      filtered();
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

  filtered() {
    if (genderselect == null && districtselect == null) {
      filteredDoctor = allDoctors;
    } else {
      filteredDoctor = allDoctors.where((doctor) {
        bool matchesGender =
            genderselect == null || doctor.gender == genderselect;
        bool matchesDistrict =
            districtselect == null || doctor.district == districtselect;
        return matchesGender && matchesDistrict;
      }).toList();
      log("filtered doctor : $filteredDoctor");
    }
    notifyListeners();
  }

  void setSelectedGender(String? gender) {
    genderselect = gender;
    filtered();
  }

  void setSelectedDistrict(String? district) {
    districtselect = district;
    filtered();
  }

  editDoctor(doctorid, DoctorModel data) async {
    try {
      await doctorservice.editDoctor(doctorid, data);
      notifyListeners();
    } catch (e) {
      log("error in edit :: $e");
    }
  }

  deleteDoctor(doctorid) async {
    try {
      await doctorservice.deleteDoctor(doctorid);
      getAllDoctors();
    } catch (e) {
      log("ntot deleted $e");
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedimage = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> uploadImage() async {
    if (selectedimage == null) return;

    isloading = true;
    notifyListeners();

    String? url = await doctorservice.uploadImage(selectedimage!);

    if (url != null) {
      imageUrl = url;
      log("Image uploaded successfully, URL: $imageUrl");
    } else {
      log("Image upload failed.");
    }

    isloading = false;
    notifyListeners();
  }
}
