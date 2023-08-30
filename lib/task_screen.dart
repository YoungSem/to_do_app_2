import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мои задачи'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) => ListView.builder(
          itemCount: taskProvider.tasks.length,
          itemBuilder: (context, index) {
            final task = taskProvider.tasks[index];
            return CheckboxListTile(
              title: Text(task.title),
              value: task.isDone,
              onChanged: (value) {
                taskProvider.toggleTask(task.id);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final title = await _showTaskDialog(context);
          if (title != null && title.isNotEmpty) {
            Provider.of<TaskProvider>(context, listen: false).addTask(title);
          }
        },
        tooltip: 'Добавить задачу',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<String?> _showTaskDialog(BuildContext context) {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Добавить задачу'),
        content: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: 'Введите задачу'),
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: Text('Добавить'),
          )
        ],
      ),
    );
  }
}