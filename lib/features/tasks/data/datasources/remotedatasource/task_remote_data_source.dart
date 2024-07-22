import 'dart:io';

import 'package:nail_it/core/error/exception.dart';
import 'package:nail_it/features/tasks/data/models/task_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class TaskRemoteDataSource {
  Future<TaskModel> createTask(TaskModel task);
  Future<TaskModel> updateTask(TaskModel task);
  Future<void> deleteTask(TaskModel task);
  Future<List<TaskModel>> getAllTasks();
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final SupabaseClient supabaseClient;
  TaskRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<TaskModel> createTask(TaskModel task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(TaskModel task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    try {
      final blogs = await supabaseClient.from('tasks').select('*, profiles (name)');
      return blogs
          .map(
            (blog) => TaskModel.fromJson(blog).copyWith(
              description: blog['profiles']['name'],
            ),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
