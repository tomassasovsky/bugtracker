// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveModelIssueAdapter extends TypeAdapter<HiveModelIssue> {
  @override
  final int typeId = 3;

  @override
  HiveModelIssue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveModelIssue(
      id: fields[0] as String?,
      createdBy: fields[1] as String?,
      createdAt: fields[2] as String?,
      updatedAt: fields[3] as String?,
      title: fields[4] as String?,
      body: fields[5] as String?,
      comments: (fields[6] as List?)?.cast<HiveModelComment>(),
      column: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveModelIssue obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdBy)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.updatedAt)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.body)
      ..writeByte(6)
      ..write(obj.comments)
      ..writeByte(7)
      ..write(obj.column);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveModelIssueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IssueStatusAdapter extends TypeAdapter<IssueStatus> {
  @override
  final int typeId = 4;

  @override
  IssueStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return IssueStatus.open;
      case 1:
        return IssueStatus.closed;
      default:
        return IssueStatus.open;
    }
  }

  @override
  void write(BinaryWriter writer, IssueStatus obj) {
    switch (obj) {
      case IssueStatus.open:
        writer.writeByte(0);
        break;
      case IssueStatus.closed:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IssueStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
