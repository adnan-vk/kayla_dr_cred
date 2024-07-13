import 'package:flutter/material.dart';
import 'package:kayla/view/addoredit/widget/addoreditwidget.dart';
import 'package:kayla/view/widgets/textfieldwidget/textfieldwidget.dart';
import 'package:kayla/view/widgets/textwidget/textwidget.dart';

class AddorEdit extends StatelessWidget {
  AddorEdit({super.key, this.value});
  final value;
  final textwidget = TextWidget();
  final textfield = textFormField();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: value == "edit"
          ? AddorEditWidget().editTopBar(context)
          : AddorEditWidget().addtopBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 80,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AddorEditWidget().textFields(context),
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
                  onPressed: () {},
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
    );
  }
}
