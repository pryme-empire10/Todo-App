class TaskModel {
  String? name;
  bool isDone;

  TaskModel({
    this.name,
    this.isDone = false,
  });

  void toggleDone(){
    isDone = !isDone;
  }
}
