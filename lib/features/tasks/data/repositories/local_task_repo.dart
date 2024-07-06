// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:nail_it/features/tasks/data/datasources/localdatasource/task_local_data_source.dart';
import 'package:nail_it/features/tasks/data/models/task_model.dart';

class TaskRepository {
  final TaskDataProvider taskDataProvider;
  TaskRepository({
    required this.taskDataProvider,
  });

  Future<List<TaskModel>> getTasks() async {
    return await taskDataProvider.getTasks();
  }

  Future<void> createNewTask(TaskModel taskModel) async {
    return await taskDataProvider.createTask(taskModel);
  }

  Future<List<TaskModel>> updateTask(TaskModel taskModel) async {
    return await taskDataProvider.updateTask(taskModel);
  }

  Future<List<TaskModel>> deleteTask(TaskModel taskModel) async {
    return await taskDataProvider.deleteTask(taskModel);
  }

  Future<List<TaskModel>> sortTasks(int sortOption) async {
    return await taskDataProvider.sortTasks(sortOption);
  }

  Future<List<TaskModel>> searchTasks(String search) async {
    return await taskDataProvider.searchTasks(search);
  }
}
