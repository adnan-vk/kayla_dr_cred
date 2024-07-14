import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:kayla/view/home_page/homewidget/homewidget.dart';

class EditWidget {
  topBar(context) {
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
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
