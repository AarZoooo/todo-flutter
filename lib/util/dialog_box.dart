import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final TextEditingController textController;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.textController,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,

      content: SizedBox(
        height: 120,
        width: 400,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            TextField(
              controller: textController,

              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Enter your task',
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.black))
              ),

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
              MyButton(text: 'Save', onPressed: onSave),

              const SizedBox(width: 10),

              MyButton(text: 'Cancel', onPressed: onCancel),
            ],)
          ],
        ),
      ),
    );
  }
}