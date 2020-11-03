// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteAdapter extends TypeAdapter<Favourite> {
  @override
  final int typeId = 1;

  @override
  Favourite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favourite(
      id: fields[0] as int,
      specialization: fields[13] as String,
      description: fields[2] as String,
      name: fields[1] as String,
      phone_1: fields[9] as String,
      phone_2: fields[10] as String,
      phone_3: fields[11] as String,
      governorate: fields[4] as String,
      area: fields[3] as String,
      longitude: fields[7] as double,
      latitude: fields[6] as double,
      mobile: fields[8] as String,
      address: fields[5] as String,
      pageID: fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Favourite obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.area)
      ..writeByte(4)
      ..write(obj.governorate)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.latitude)
      ..writeByte(7)
      ..write(obj.longitude)
      ..writeByte(8)
      ..write(obj.mobile)
      ..writeByte(9)
      ..write(obj.phone_1)
      ..writeByte(10)
      ..write(obj.phone_2)
      ..writeByte(11)
      ..write(obj.phone_3)
      ..writeByte(12)
      ..write(obj.pageID)
      ..writeByte(13)
      ..write(obj.specialization);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
