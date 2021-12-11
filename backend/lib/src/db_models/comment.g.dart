// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveModelCommentAdapter extends TypeAdapter<HiveModelComment> {
  @override
  final int typeId = 5;

  @override
  HiveModelComment read(BinaryReader reader) {
    return HiveModelComment();
  }

  @override
  void write(BinaryWriter writer, HiveModelComment obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveModelCommentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
