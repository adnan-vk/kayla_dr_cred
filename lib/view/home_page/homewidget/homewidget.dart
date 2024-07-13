import 'package:flutter/material.dart';
import 'package:kayla/view/widgets/textwidget.dart';

TextWidget textwidget = TextWidget();

class HomeWidget {
  List<DropdownMenuItem<String>> districtItems = [
    DropdownMenuItem(
        value: 'Alappuzha', child: textwidget.text(data: 'Alappuzha')),
    DropdownMenuItem(
        value: 'Ernakulam', child: textwidget.text(data: 'Ernakulam')),
    DropdownMenuItem(value: 'Idukki', child: textwidget.text(data: 'Idukki')),
    DropdownMenuItem(value: 'Kannur', child: textwidget.text(data: 'Kannur')),
    DropdownMenuItem(
        value: 'Kasaragod', child: textwidget.text(data: 'Kasaragod')),
    DropdownMenuItem(value: 'Kollam', child: textwidget.text(data: 'Kollam')),
    DropdownMenuItem(
        value: 'Kottayam', child: textwidget.text(data: 'Kottayam')),
    DropdownMenuItem(
        value: 'Kozhikode', child: textwidget.text(data: 'Kozhikode')),
    DropdownMenuItem(
        value: 'Malappuram', child: textwidget.text(data: 'Malappuram')),
    DropdownMenuItem(
        value: 'Palakkad', child: textwidget.text(data: 'Palakkad')),
    DropdownMenuItem(
        value: 'Pathanamthitta',
        child: textwidget.text(data: 'Pathanamthitta')),
    DropdownMenuItem(
        value: 'Thiruvananthapuram',
        child: textwidget.text(
          data: 'Trivandrum',
        )),
    DropdownMenuItem(
        value: 'Thrissur', child: textwidget.text(data: 'Thrissur')),
    DropdownMenuItem(value: 'Wayanad', child: textwidget.text(data: 'Wayanad')),
  ];
  topBar(context) {
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
            onChanged: (value) {},
          ),
        ),
        SizedBox(
          width: size.width * .23,
          child: DropdownButton(
            underline: Container(
              height: 0,
            ),
            isExpanded: true,
            hint: textwidget.text(data: "District"),
            items: districtItems,
            onChanged: (value) {},
          ),
        )
      ],
    );
  }

  doctorCard(context) {
    final size = MediaQuery.of(context).size;
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
                border: Border.all(color: const Color(0xFF019744), width: 2),
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
                  child: textwidget.text(data: "Dr Neeraj Madhav", size: 13.0),
                ),
                textwidget.text(
                  data: "BAMS, Resident Medical Officer",
                  size: 7.0,
                  color: Colors.grey,
                ),
                textwidget.text(
                  data: "Eranankulam",
                  size: 7.0,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              width: size.width * .23,
              height: size.height * .03,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                      Color(0xFF019744),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
                onPressed: () {},
                child: textwidget.text(
                    data: "Edit Profile", size: 6.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
