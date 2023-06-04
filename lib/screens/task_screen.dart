import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts/colors.dart';
import '../consts/text_style.dart';
import '../provider/task_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/task_list_view.dart';
import 'add_bottom_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 20, top: 80, right: 20, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Todo App',
                          style: bigTextStyle,
                        ),
                        Text(
                          '${Provider.of<TaskProvider>(context).taskCount()} tasks',
                          style: smallTextStyle,
                        ),
                      ],
                    ),
                    CustomButton(
                      text: 'Add New',
                      style: headerButtonTextStyle,
                      buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.whiteColor,
                        minimumSize: const Size(0, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) => AddBottomScreen(),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 3),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
              ),
              child: const TaskListView(),
            ),
          )
        ],
      ),
    );
  }
}
