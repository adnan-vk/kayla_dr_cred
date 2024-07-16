import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:kayla/controller/addoreditcontroller/addoreditcontroller.dart';
import 'package:kayla/controller/doctorcontroller/doctorcontroller.dart';
import 'package:kayla/model/doctormodel.dart';
import 'package:kayla/view/editpage/widget/editwidget.dart';
import 'package:kayla/view/widgets/snackbarwidget/snack_bar_widgets.dart';
import 'package:kayla/view/widgets/textfieldwidget/textfieldwidget.dart';
import 'package:kayla/view/widgets/textwidget/textwidget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Edit extends StatefulWidget {
  DoctorModel doctor;
  Edit({super.key, required this.doctor});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? district;
  String? gender;
  String? image;
  final textwidget = TextWidget();
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController(text: widget.doctor.name);
    emailController = TextEditingController(text: widget.doctor.email);
    phoneController = TextEditingController(text: widget.doctor.phone);
    district = widget.doctor.district;
    gender = widget.doctor.gender;
    image = widget.doctor.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AddorEditController>(context, listen: false);
    return Scaffold(
      appBar: EditWidget().topBar(context, widget.doctor.id),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage("$image"),
                      child: image == null
                          ? const Icon(
                              EneftyIcons.people_outline,
                              size: 40,
                            )
                          : null,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    textFormField().textformfield(
                        type: "name",
                        controller: nameController,
                        labeltext: "Full Name"),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                      hint: textwidget.text(data: "District"),
                      items: pro.districtItems,
                      value: district,
                      onChanged: (value) {
                        district = value.toString();
                      },
                      decoration: InputDecoration(
                        labelText: 'District',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.15),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textFormField().textformfield(
                        controller: emailController, labeltext: "Email"),
                    const SizedBox(
                      height: 20,
                    ),
                    textFormField().textformfield(
                        max: 10,
                        keytype: TextInputType.number,
                        controller: phoneController,
                        labeltext: "Phone Number"),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                      value: gender,
                      hint: textwidget.text(data: "Gender"),
                      items: [
                        DropdownMenuItem(
                          value: 'male',
                          child: textwidget.text(data: "Male"),
                        ),
                        DropdownMenuItem(
                          value: 'female',
                          child: textwidget.text(data: "Female"),
                        ),
                      ],
                      onChanged: (value) {
                        gender = value.toString();
                      },
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.13),
                      ),
                    ),
                  ],
                ),
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
                      updateProduct(context, widget.doctor);
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

  updateProduct(context, DoctorModel data) async {
    final getProvider = Provider.of<DoctorController>(context, listen: false);
    data.name = nameController.text;
    data.email = emailController.text;
    data.phone = phoneController.text;
    data.district = district;
    data.gender = gender;
    await getProvider.editDoctor(data.id, data);
    Navigator.pop(context);
    SnackBarWidget()
        .iconSnackSuccess(context, label: "Product updated successfully");
  }
}
