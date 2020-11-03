// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FileDtoAdapter extends TypeAdapter<FileDto> {
  @override
  final int typeId = 11;

  @override
  FileDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FileDto(
      id: fields[0] as int,
      file: fields[5] as String,
      approvalId: fields[1] as int,
      fileDir: fields[4] as String,
      fileLink: fields[6] as String,
      fileName: fields[2] as String,
      fileType: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FileDto obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.approvalId)
      ..writeByte(2)
      ..write(obj.fileName)
      ..writeByte(3)
      ..write(obj.fileType)
      ..writeByte(4)
      ..write(obj.fileDir)
      ..writeByte(5)
      ..write(obj.file)
      ..writeByte(6)
      ..write(obj.fileLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
