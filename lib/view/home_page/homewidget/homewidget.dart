import 'package:flutter/material.dart';
import 'package:kayla/controller/doctorcontroller/doctorcontroller.dart';
import 'package:kayla/controller/homecontroller/homecontroller.dart';
import 'package:kayla/view/editpage/edit.dart';
import 'package:kayla/view/widgets/buttonwidget/buttonwidget.dart';
import 'package:kayla/view/widgets/textwidget/textwidget.dart';
import 'package:provider/provider.dart';

TextWidget textwidget = TextWidget();

class HomeWidget {
  topBar(context) {
    final pro = Provider.of<HomeController>(context, listen: false);
    final provider = Provider.of<DoctorController>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return AppBar(
      title: textwidget.text(data: "Doctors"),
      actions: [
        SizedBox(
          width: size.width * .25,
          child: DropdownButton(
            underline: Container(
              height: 0,
            ),
            hint: textwidget.text(data: "Gender"),
            value: provider.genderselect,
            items: pro.gender,
            onChanged: (value) {
              provider.setSelectedGender(value);
            },
          ),
        ),
        SizedBox(
          width: size.width * .23,
          child: DropdownButton(
            underline: Container(
              height: 0,
            ),
            isExpanded: true,
            value: provider.districtselect,
            hint: textwidget.text(data: "District"),
            items: pro.districtItems,
            onChanged: (value) {
              provider.setSelectedDistrict(value);
            },
          ),
        )
      ],
    );
  }

  doctorCard(context, index) {
    final size = MediaQuery.of(context).size;
    return Consumer<DoctorController>(builder: (context, value, child) {
      if (value.filteredDoctor.isEmpty) {
        return const Center(
          child: Text("data"),
        );
      } else {
        final doctor = value.filteredDoctor[index];
        return Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Row(
              children: [
                Container(
                  height: size.height * .12,
                  width: size.width * .20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(doctor.imageUrl!),
                    ),
                    border:
                        Border.all(color: const Color(0xFF019744), width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 241, 250, 241),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * .34,
                      child: textwidget.text(data: doctor.name, size: 13.0),
                    ),
                    textwidget.text(
                      data: doctor.email,
                      size: 7.0,
                      color: Colors.grey,
                    ),
                    textwidget.text(
                      data: doctor.district,
                      size: 7.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  height: 25,
                  child: ButtonWidget().elevatedbutton(
                    text: "Edit Profile",
                    color: const Color(0xFF019744),
                    context: context,
                    page: Edit(
                      doctor: doctor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
