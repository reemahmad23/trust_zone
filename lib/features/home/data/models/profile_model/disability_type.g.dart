// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disability_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DisabilityTypeAdapter extends TypeAdapter<DisabilityType> {
  @override
  final int typeId = 0;

  @override
  DisabilityType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DisabilityType(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DisabilityType obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisabilityTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
