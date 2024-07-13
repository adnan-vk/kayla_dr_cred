import 'package:flutter/material.dart';
import 'package:kayla/controller/homecontroller/homecontroller.dart';
import 'package:kayla/view/addoredit/addoredit.dart';
import 'package:kayla/view/widgets/buttonwidget/buttonwidget.dart';
import 'package:kayla/view/widgets/textwidget/textwidget.dart';
import 'package:provider/provider.dart';

TextWidget textwidget = TextWidget();

class HomeWidget {
  topBar(context) {
    final pro = Provider.of<HomeController>(context, listen: false);
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
            items: pro.gender,
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
            items: pro.districtItems,
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
              width: 100,
              height: 25,
              child: ButtonWidget().elevatedbutton(
                text: "Edit Profile",
                color: const Color(0xFF019744),
                context: context,
                page: AddorEdit(
                  value: "edit",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
