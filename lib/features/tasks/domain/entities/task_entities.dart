class TaskEntity {
  final String id;
  final String title;
  final String description;
  final DateTime? startDateTime;
  final DateTime? stopDateTime;
  final bool completed;

  TaskEntity({
     required this.id,
    required this.title,
    required this.description,
    required  this.startDateTime,
    required this.stopDateTime,
    required this.completed,
  });
}
