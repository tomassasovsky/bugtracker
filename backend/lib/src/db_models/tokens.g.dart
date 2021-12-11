// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveModelRefreshTokenAdapter extends TypeAdapter<HiveModelRefreshToken> {
  @override
  final int typeId = 6;

  @override
  HiveModelRefreshToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveModelRefreshToken(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveModelRefreshToken obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.refreshToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveModelRefreshTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
