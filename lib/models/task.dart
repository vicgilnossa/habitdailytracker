class Task {
  final String id;
  final String name;
  late final bool? isCompleted;

  Task({
    required this.id,
    required this.name,
    this.isCompleted = false,
  });
}
