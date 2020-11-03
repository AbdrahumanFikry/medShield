import 'package:hive/hive.dart';
import 'package:med_shield_new_version/services/repositories/management/cacheConsts.dart';

part 'file.g.dart';

@HiveType(typeId: fileCacheId)
class FileDto {
  @HiveField(0)
  int id;

  @HiveField(1)
  int approvalId;

  @HiveField(2)
  String fileName;

  @HiveField(3)
  String fileType;

  @HiveField(4)
  String fileDir;

  @HiveField(5)
  String file;

  @HiveField(6)
  String fileLink;

  FileDto({
    this.id,
    this.file,
    this.approvalId,
    this.fileDir,
    this.fileLink,
    this.fileName,
    this.fileType,
  });
}
