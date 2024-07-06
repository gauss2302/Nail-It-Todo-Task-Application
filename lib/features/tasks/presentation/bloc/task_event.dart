part of 'task_bloc.dart';

sealed class TaskEvent {}

class AddNewTaskEvent extends TaskEvent {}

class FetchTaskEvent extends TaskEvent {}

class SortTaskEvent extends TaskEvent {}

class UpdateTaskEvent extends TaskEvent {}

class DeleteTaskEvent extends TaskEvent {}

class SearchTaskEvent extends TaskEvent {}
