class ToDos {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ToDos(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory ToDos.fromJson(Map<String, dynamic> json) {
    return ToDos(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']);
  }
}
