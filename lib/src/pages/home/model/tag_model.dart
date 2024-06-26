import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'tag_model.g.dart';

@HiveType(typeId: 1)
class TagModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int color;

  TagModel({required this.name, required this.color});

  TagModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        color = (json['color']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'color': color,
      };

  TagModel copyWith({String? name, Color? color}) {
    return TagModel(
      name: name ?? this.name,
      color: color?.value ?? this.color,
    );
  }
}
