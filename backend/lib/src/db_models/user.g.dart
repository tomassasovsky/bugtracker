// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveModelUserAdapter extends TypeAdapter<HiveModelUser> {
  @override
  final int typeId = 0;

  @override
  HiveModelUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveModelUser(
      name: fields[0] as String?,
      email: fields[1] as String?,
      password: fields[2] as String,
      photo: fields[3] as String?,
      projects: (fields[4] as List?)?.cast<String>(),
      tasks: (fields[5] as List?)?.cast<String>(),
      createdAt: fields[6] as DateTime?,
    )..updatedAt = fields[7] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, HiveModelUser obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.projects)
      ..writeByte(5)
      ..write(obj.tasks)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveModelUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
