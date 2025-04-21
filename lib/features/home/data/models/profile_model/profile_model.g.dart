// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileModelAdapter extends TypeAdapter<ProfileModel> {
  @override
  final int typeId = 0;

  @override
  ProfileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileModel(
      id: fields[0] as String?,
      userName: fields[1] as String,
      userEmail: fields[2] as String,
      age: fields[3] as int?,
      profilePictureUrl: fields[4] as dynamic,
      coverPictureUrl: fields[5] as dynamic,
      registrationDate: fields[6] as DateTime?,
      isActive: fields[7] as bool?,
      disabilityTypes: (fields[8] as List?)?.cast<DisabilityType>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProfileModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.userEmail)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.profilePictureUrl)
      ..writeByte(5)
      ..write(obj.coverPictureUrl)
      ..writeByte(6)
      ..write(obj.registrationDate)
      ..writeByte(7)
      ..write(obj.isActive)
      ..writeByte(8)
      ..write(obj.disabilityTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
