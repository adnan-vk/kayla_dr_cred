import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kayla/model/doctormodel.dart';
import 'package:kayla/service/doctorservice.dart';
import 'package:kayla/view/add/add.dart';

class DoctorController extends ChangeNotifier {
  CroppedFile? croppedFile;
  var path;
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
    if (croppedFile == null) return;

    isloading = true;
    notifyListeners();

    String? url = await doctorservice.uploadImage(path!);

    if (url != null) {
      imageUrl = url;
      log("Image uploaded successfully, URL: $imageUrl");
    } else {
      log("Image upload failed.");
    }

    isloading = false;
    notifyListeners();
  }

  Future<void> pickAndCropImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPresetCustom(),
            ],
          ),
        ],
      );

      if (croppedFile != null) {
        // Use the cropped file as needed
        log('Cropped file path: ${croppedFile?.path}');
      }
      path = croppedFile?.path;
      log("path is : $path");
      notifyListeners();
    }
  }
}
