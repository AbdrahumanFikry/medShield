// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approval.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApprovalDtoAdapter extends TypeAdapter<ApprovalDto> {
  @override
  final int typeId = 2;

  @override
  ApprovalDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ApprovalDto(
      id: fields[0] as int,
      title: fields[5] as String,
      statues: fields[1] as String,
      company_name: fields[3] as String,
      employee_number: fields[2] as String,
      more_details: fields[6] as String,
      provider_name: fields[4] as String,
      replay_by: fields[7] as int,
      files: (fields[8] as List)?.cast<FileDto>(),
      approval_comments: (fields[9] as List)?.cast<ApprovalCommentsDto>(),
      add_date: fields[10] as DateTime,
      createdAt: fields[12] as DateTime,
      deletedAt: fields[13] as DateTime,
      updatedAt: fields[11] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ApprovalDto obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.statues)
      ..writeByte(2)
      ..write(obj.employee_number)
      ..writeByte(3)
      ..write(obj.company_name)
      ..writeByte(4)
      ..write(obj.provider_name)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.more_details)
      ..writeByte(7)
      ..write(obj.replay_by)
      ..writeByte(8)
      ..write(obj.files)
      ..writeByte(9)
      ..write(obj.approval_comments)
      ..writeByte(10)
      ..write(obj.add_date)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.deletedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApprovalDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
