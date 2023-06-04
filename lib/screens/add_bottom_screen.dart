import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskflow/consts/colors.dart';
import 'package:taskflow/provider/task_provider.dart';

import '../consts/text_style.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_sizebox.dart';

class AddBottomScreen extends StatelessWidget {
  AddBottomScreen({super.key});

  String? newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.only(left: 70, right: 70, top: 50),
      child: Column(
        children: [
          Text(
            'Add New Task',
            style: bottomSheetTextStyle,
          ),
          TextFormField(
            textAlign: TextAlign.center,
            cursorColor: Colors.grey,
            onChanged: (value) {
              newTaskTitle = value;
            },
          ),
          customSizeBox(20),
          CustomButton(
            text: 'Save',
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              minimumSize: const Size(100, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: bottomButtonTextStyle,
            onPressed: () {
              Provider.of<TaskProvider>(context, listen: false)
                  .addTask(newTaskTitle!);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Task Added'),
              ));
            },
          )
        ],
      ),
    );
  }
}
