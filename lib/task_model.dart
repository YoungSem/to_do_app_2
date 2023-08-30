class TaskModel {
  final int id;
  final String title;
  late final bool isDone;

  TaskModel({
    required this.id,
    required this.title,
    this.isDone = false
  });
}