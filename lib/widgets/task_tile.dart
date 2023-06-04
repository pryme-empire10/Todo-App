import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taskflow/consts/colors.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final bool isChecked;
  final ValueChanged onPressedCallback;
  final ValueChanged onChangedCallback;
  final VoidCallback textOnTapCallback;
  const TaskItem({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onChangedCallback,
    required this.onPressedCallback,
    required this.textOnTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onPressedCallback,
            backgroundColor: Colors.red,
            label: 'Delete',
            icon: Icons.delete,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        // color: Colors.grey.withOpacity(0.2),
        child: ListTile(
          // visualDensity: const VisualDensity(horizontal: -4, vertical: -3),
          leading: Checkbox(
            value: isChecked,
            activeColor: AppColors.mainColor,
            onChanged: onChangedCallback,
          ),
          title: Text(
            title,
            style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
