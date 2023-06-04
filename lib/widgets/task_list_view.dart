import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../provider/task_provider.dart';
import 'task_tile.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskData, child) {
        return SlidableAutoCloseBehavior(
          // closeWhenTapped: true,
          closeWhenOpened: true,
          child: ListView.builder(
            itemCount: taskData.taskCount(),
            itemBuilder: (context, index) {
              final newTask = taskData.task[index];
              return TaskItem(
                textOnTapCallback: () {
                  taskData.toggleCheckBox(newTask);
                },
                title: newTask.name!,
                isChecked: newTask.isDone,
                onChangedCallback: (value) {
                  taskData.toggleCheckBox(newTask);
                },
                onPressedCallback: (value) {
                  taskData.deleteTask(newTask);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Task Deleted'),
                    ));
                },
              );
            },
          ),
        );
      },
    );
  }
}
