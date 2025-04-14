// import 'dart:async';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nail_it/features/tasks/data/repositories/local_task_repo.dart';
//
// part 'task_event.dart';
//
// part 'task_state.dart';
//
// class TaskBloc extends Bloc<TaskEvent, TaskState> {
//   final TaskRepository taskRepository;
//   TaskBloc(this.taskRepository) : super(FetchTaskSuccess()) {
//     on<AddNewTaskEvent>(_addNewTask);
//     on<FetchTaskEvent>(_fetchTasks);
//     on<SortTaskEvent>(_sortTask);
//     on<UpdateTaskEvent>(_updateTask);
//     on<DeleteTaskEvent>(_deleteTask);
//     on<SearchTaskEvent>(_searchTask);
//   }
//
//   _addNewTask(AddNewTaskEvent event, Emitter<TaskState> emit) {}
//
//   _fetchTasks(FetchTaskEvent event, Emitter<TaskState> emit) {}
//
//   _sortTask(SortTaskEvent event, Emitter<TaskState> emit) {}
//
//   _updateTask(UpdateTaskEvent event, Emitter<TaskState> emit) {}
//
//   _deleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) {}
//
//   _searchTask(SearchTaskEvent event, Emitter<TaskState> emit) {}
// }
