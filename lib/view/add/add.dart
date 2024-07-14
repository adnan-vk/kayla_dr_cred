import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:kayla/controller/doctorcontroller/doctorcontroller.dart';
import 'package:kayla/model/doctormodel.dart';
import 'package:kayla/view/add/widget/addwidget.dart';
import 'package:kayla/view/widgets/snackbarwidget/snack_bar_widgets.dart';
import 'package:kayla/view/widgets/textfieldwidget/textfieldwidget.dart';
import 'package:kayla/view/widgets/textwidget/textwidget.dart';
import 'package:provider/provider.dart';

class Add extends StatelessWidget {
  DoctorModel? doctor;
  Add({super.key, this.doctor});
  final textwidget = TextWidget();
  final textfield = textFormField();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<DoctorController>(context, listen: false);
    return Scaffold(
      appBar: AddWidget().addtopBar(context),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Consumer<DoctorController>(
                    builder: (context, value, child) => GestureDetector(
                      onTap: () {
                        pro.pickImage();
                      },
                      child: CircleAvatar(
                        backgroundImage: value.selectedimage != null
                            ? Image.file(value.selectedimage!).image
                            : null,
                        radius: 80,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AddWidget().textFields(context),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xFF019744),
                      ),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        addData(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: textwidget.text(data: "SAVE", color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addData(context) async {
    final pro = Provider.of<DoctorController>(context, listen: false);
    final data = DoctorModel(
      id: DateTime.now().toString(),
      email: pro.emailController.text,
      name: pro.nameController.text,
      district: pro.district,
      gender: pro.gender,
      phone: pro.phoneController.text,
      imageUrl: pro.imageUrl,
    );
    log("image url is : ${pro.imageUrl}");
    await pro.addDoctor(data);
    await pro.uploadImage();
    SnackBarWidget()
        .iconSnackSuccess(context, label: "Doctor added Successfully");
    Navigator.pop(context);
    pro.clearControllers();
  }
}
