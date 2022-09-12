class TaskModel{
  final int? id;
  final String type;
  final startCount;
  int count;

  TaskModel({
    this.id,
    required this.count,
    required this.type,
    required this.startCount});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      id: json["id"],
      type: json["type"],
      startCount: json["startCount"],
      count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "startCount": startCount,
    "count": count,
  };
}