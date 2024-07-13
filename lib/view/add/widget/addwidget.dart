import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:kayla/controller/addoreditcontroller/addoreditcontroller.dart';
import 'package:kayla/controller/doctorcontroller/doctorcontroller.dart';
import 'package:kayla/view/home_page/homewidget/homewidget.dart';
import 'package:kayla/view/widgets/textfieldwidget/textfieldwidget.dart';
import 'package:provider/provider.dart';

class AddWidget {
  addtopBar(context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(EneftyIcons.arrow_left_3_outline),
      ),
      centerTitle: true,
      title: textwidget.text(data: "Add Doctor", weight: FontWeight.w600),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        )
      ],
    );
  }

  textFields(context) {
    final pro = Provider.of<AddorEditController>(context, listen: false);
    final provider = Provider.of<DoctorController>(context, listen: false);
    return Column(
      children: [
        textFormField().textformfield(
            controller: provider.nameController, labeltext: "Full Name"),
        const SizedBox(
          height: 20,
        ),
        DropdownButtonFormField(
          hint: textwidget.text(data: "District"),
          items: pro.districtItems,
          onChanged: (value) {
            provider.district = value.toString();
          },
          decoration: InputDecoration(
            labelText: 'District',
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.grey.withOpacity(.15),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        textFormField().textformfield(
            controller: provider.emailController, labeltext: "Email"),
        const SizedBox(
          height: 20,
        ),
        textFormField().textformfield(
            max: 10,
            keytype: TextInputType.number,
            controller: provider.phoneController,
            labeltext: "Phone Number"),
        const SizedBox(
          height: 20,
        ),
        DropdownButtonFormField(
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
            provider.gender = value.toString();
          },
          decoration: InputDecoration(
            labelText: 'Gender',
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.grey.withOpacity(.13),
          ),
        ),
      ],
    );
  }
}
