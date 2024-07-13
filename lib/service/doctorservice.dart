import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kayla/model/doctormodel.dart';

class DoctorService {
  String doctor = "doctor";
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<DoctorModel> doct;
  Reference storage = FirebaseStorage.instance.ref();

  // DoctorService() {
  //   doct = firestore.collection(doctor).withConverter<DoctorModel>(
  //     fromFirestore: (snapshot, options) {
  //       return DoctorModel.fromjson(
  //         snapshot.id,
  //         snapshot.data()!,
  //       );
  //     },
  //     toFirestore: (value, options) {
  //       return value.tojson();
  //     },
  //   );
  // }

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
}
