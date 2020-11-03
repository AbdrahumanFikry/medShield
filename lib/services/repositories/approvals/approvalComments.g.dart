// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approvalComments.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApprovalCommentsDtoAdapter extends TypeAdapter<ApprovalCommentsDto> {
  @override
  final int typeId = 22;

  @override
  ApprovalCommentsDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ApprovalCommentsDto(
      id: fields[0] as int,
      files: (fields[6] as List)?.cast<FileDto>(),
      approvalId: fields[1] as int,
      admin_name: fields[5] as String,
      app_user_name: fields[4] as String,
      comment: fields[3] as String,
      replay_with: fields[2] as String,
      updatedAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ApprovalCommentsDto obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.approvalId)
      ..writeByte(2)
      ..write(obj.replay_with)
      ..writeByte(3)
      ..write(obj.comment)
      ..writeByte(4)
      ..write(obj.app_user_name)
      ..writeByte(5)
      ..write(obj.admin_name)
      ..writeByte(6)
      ..write(obj.files)
      ..writeByte(7)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApprovalCommentsDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
