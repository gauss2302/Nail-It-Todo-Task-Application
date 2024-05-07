import 'package:nail_it/features/tasks/domain/entities/task_entities.dart';

class TaskModel extends TaskEntity {
  TaskModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.completed});

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      completed: map['completed'] ?? false,
    );
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? completed,
  }) {
    return TaskModel(
      id: id ?? super.id,
      title: title ?? super.title,
      description: description ?? super.description,
      completed: completed ?? super.completed,
    );
  }
}
