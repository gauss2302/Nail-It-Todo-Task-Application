part of "task_bloc.dart";

sealed class TaskState {}

final class FetchTaskSuccess extends TaskState {}

final class AddTaskSuccess extends TaskState {}

final class LoadTaskFailure extends TaskState {}

final class AddTaskFailure extends TaskState {}

final class UpdateTaskSuccess extends TaskState {}
