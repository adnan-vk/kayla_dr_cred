import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kayla/model/doctormodel.dart';

class DoctorService {
  String doctor = "doctor";
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference storage = FirebaseStorage.instance.ref();

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

  deleteDoctor(doctorid) async {
    try {
      await firestore.collection(doctor).doc(doctorid).delete();
    } catch (e) {
      log("data not deleted");
    }
  }

  Future<String?> uploadImage(File image) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = storage.child('uploads/$fileName');
      UploadTask uploadTask = reference.putFile(image);
      TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      log("upload error: $e");
      return null;
    }
  }
}
