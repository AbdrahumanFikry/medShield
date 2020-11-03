// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selectors.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectorsAdapter extends TypeAdapter<Selectors> {
  @override
  final int typeId = 3;

  @override
  Selectors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Selectors()
      ..area = (fields[0] as List)?.cast<Options>()
      ..governorate = (fields[1] as List)?.cast<Options>()
      ..specialization = (fields[2] as List)?.cast<Options>()
      ..service_provider_type = (fields[3] as List)?.cast<Options>()
      ..id = fields[4] as int;
  }

  @override
  void write(BinaryWriter writer, Selectors obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.area)
      ..writeByte(1)
      ..write(obj.governorate)
      ..writeByte(2)
      ..write(obj.specialization)
      ..writeByte(3)
      ..write(obj.service_provider_type)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
