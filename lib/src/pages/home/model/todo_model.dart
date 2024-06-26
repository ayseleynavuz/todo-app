import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/pages/home/model/tag_model.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final DateTime createdDate;
  @HiveField(3)
  final bool isCompleted;
  @HiveField(4)
  final TagModel? tag;
  @HiveField(5)
  final double progress;

  TodoModel({
    required this.id,
    required this.title,
    required this.createdDate,
    required this.isCompleted,
    required this.tag,
    required this.progress,
  });

  TodoModel copyWith({
    String? id,
    String? title,
    DateTime? createdDate,
    bool? isCompleted,
    TagModel? tag,
    double? progress,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      createdDate: createdDate ?? this.createdDate,
      isCompleted: isCompleted ?? this.isCompleted,
      tag: tag ?? this.tag,
      progress: progress ?? this.progress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'isCompleted': isCompleted,
      'tag': tag,
      'progress': progress,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      createdDate: DateTime.fromMillisecondsSinceEpoch(map['createdDate']),
      isCompleted: map['isCompleted'],
      tag: TagModel.fromJson(map['tag']),
      progress: map['progress'],
    );
  }
}
