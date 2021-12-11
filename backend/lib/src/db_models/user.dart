import 'dart:convert';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class HiveModelUser extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String password;

  @HiveField(3)
  String? photo;

  @HiveField(4)
  List<String>? projects;

  @HiveField(5)
  List<String>? tasks;

  @HiveField(6)
  DateTime? createdAt;

  @HiveField(7)
  DateTime? updatedAt;

  HiveModelUser({
    this.name,
    required this.email,
    required this.password,
    this.photo,
    this.projects,
    this.tasks,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (photo != null) 'photo': photo,
      if (projects != null) 'projects': projects,
      if (tasks != null) 'tasks': tasks,
      if (createdAt != null) 'createdAt': createdAt?.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory HiveModelUser.fromMap(Map<String, dynamic> map) {
    return HiveModelUser(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      photo: map['photo'],
      projects: map['projects'] != null ? List<String>.from(map['projects']) : null,
      tasks: map['tasks'] != null ? List<String>.from(map['tasks']) : null,
      createdAt: DateTime.tryParse(map['createdAt']),
    );
  }

  @override
  Future<void> save() async {
    updatedAt = DateTime.now();
    return await super.save();
  }

  String toJson() => jsonEncode(toMap());
  factory HiveModelUser.fromJson(String source) => HiveModelUser.fromMap(json.decode(source));

  factory HiveModelUser.search(String email) {
    return Hive.box('users').values.firstWhere(
          (user) => user.email == email,
          orElse: () {},
        );
  }
}
