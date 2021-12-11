import 'package:hive/hive.dart';

import 'package:bugtracker/src/db_models/comment.dart';

part 'issue.g.dart';

@HiveType(typeId: 3)
class HiveModelIssue extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? createdBy;

  @HiveField(2)
  final String? createdAt;

  @HiveField(3)
  final String? updatedAt;

  @HiveField(4)
  final String? title;

  @HiveField(5)
  final String? body;

  @HiveField(6)
  final List<HiveModelComment>? comments;

  @HiveField(7)
  final String? column;

  HiveModelIssue({
    this.id,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.body,
    this.comments,
    this.column,
  });
}

@HiveType(typeId: 4)
enum IssueStatus {
  @HiveField(0)
  open,
  @HiveField(1)
  closed,
}
