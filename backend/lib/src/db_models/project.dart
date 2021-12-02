import 'package:hive/hive.dart';

part 'project.g.dart';

@HiveType(typeId: 1)
class HiveModelProject extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? description;

  @HiveField(3)
  ProjectStatus? status;

  @HiveField(4)
  DateTime? startDate;

  @HiveField(5)
  DateTime? endDate;

  HiveModelProject({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
  });
}

@HiveType(typeId: 2)
enum ProjectStatus {
  @HiveField(0)
  active,
  @HiveField(1)
  completed,
  @HiveField(2)
  canceled,
}
