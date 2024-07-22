// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:nail_it/features/tasks/data/datasources/localdatasource/task_local_data_source.dart';
import 'package:nail_it/features/tasks/data/models/task_model.dart';

class TaskRepository {
  final LocalTaskDataProvider localtaskDataProvider;
  TaskRepository({
    required this.localtaskDataProvider,
  });

  Future<List<TaskModel>> getTasks() async {
    return await localtaskDataProvider.getTasks();
  }

  Future<void> createNewTask(TaskModel taskModel) async {
    return await localtaskDataProvider.createTask(taskModel);
  }

  Future<List<TaskModel>> updateTask(TaskModel taskModel) async {
    return await localtaskDataProvider.updateTask(taskModel);
  }

  Future<List<TaskModel>> deleteTask(TaskModel taskModel) async {
    return await localtaskDataProvider.deleteTask(taskModel);
  }

  Future<List<TaskModel>> sortTasks(int sortOption) async {
    return await localtaskDataProvider.sortTasks(sortOption);
  }

  Future<List<TaskModel>> searchTasks(String search) async {
    return await localtaskDataProvider.searchTasks(search);
  }
}
