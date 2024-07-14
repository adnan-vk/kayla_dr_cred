import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:kayla/controller/doctorcontroller/doctorcontroller.dart';
import 'package:kayla/view/home_page/homewidget/homewidget.dart';
import 'package:kayla/view/widgets/snackbarwidget/snack_bar_widgets.dart';
import 'package:provider/provider.dart';

class EditWidget {
  topBar(context, doctor) {
    final pro = Provider.of<DoctorController>(context, listen: false);
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(EneftyIcons.arrow_left_3_outline),
      ),
      centerTitle: true,
      title: textwidget.text(data: "Edit Doctor", weight: FontWeight.w600),
      actions: [
        IconButton(
          onPressed: () async {
            await pro.deleteDoctor(doctor);
            SnackBarWidget().iconSnackFail(context, label: "Doctor Deleted");
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
