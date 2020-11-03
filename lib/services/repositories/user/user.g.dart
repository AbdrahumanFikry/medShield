// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..id = fields[0] as int
      ..name = fields[1] as String
      ..email = fields[2] as String
      ..image = fields[3] as String
      ..phone = fields[4] as String
      ..company_name = fields[5] as String
      ..gender = fields[6] as String
      ..date_of_birth = fields[7] as String
      ..insurance_type = fields[8] as String
      ..medication = fields[9] as String
      ..start_date = fields[10] as String
      ..end_date = fields[11] as String
      ..medicalId = fields[12] as String
      ..customer_number = fields[13] as int;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.company_name)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.date_of_birth)
      ..writeByte(8)
      ..write(obj.insurance_type)
      ..writeByte(9)
      ..write(obj.medication)
      ..writeByte(10)
      ..write(obj.start_date)
      ..writeByte(11)
      ..write(obj.end_date)
      ..writeByte(12)
      ..write(obj.medicalId)
      ..writeByte(13)
      ..write(obj.customer_number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
