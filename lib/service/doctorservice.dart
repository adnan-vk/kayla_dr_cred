import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kayla/model/doctormodel.dart';

class DoctorService {
  String doctor = "doctor";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<DoctorModel>> getAllDoctors() async {
    final snapshot = await firestore.collection(doctor).get();
    return snapshot.docs
        .map(
          (item) => DoctorModel.fromjson(
            item.data(),
          ),
        )
        .toList();
  }

  Future<void> addDoctor(DoctorModel data) async {
    try {
      await firestore.collection(doctor).doc(data.id).set(
            data.tojson(),
          );
      log("Doctor added");
    } catch (e) {
      log("error in adding item : $e");
    }
  }

  editDoctor(doctorid, DoctorModel data) async {
    try {
      await firestore.collection(doctor).doc(doctorid).update(data.tojson());
    } catch (e) {
      log("error in edit data : $e");
    }
  }
}
