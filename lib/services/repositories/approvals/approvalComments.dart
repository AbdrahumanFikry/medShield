import 'package:hive/hive.dart';
import 'package:med_shield_new_version/services/repositories/approvals/file.dart';
import 'package:med_shield_new_version/services/repositories/management/cacheConsts.dart';

part 'approvalComments.g.dart';

@HiveType(typeId: commentsCacheId)
class ApprovalCommentsDto {
  @HiveField(0)
  int id;

  @HiveField(1)
  int approvalId;

  @HiveField(2)
  String replay_with;

  @HiveField(3)
  String comment;

  @HiveField(4)
  String app_user_name;

  @HiveField(5)
  String admin_name;

  @HiveField(6)
  List<FileDto> files;
  @HiveField(7)
  DateTime updatedAt;

  ApprovalCommentsDto(
      {this.id,
      this.files,
      this.approvalId,
      this.admin_name,
      this.app_user_name,
      this.comment,
      this.replay_with,
      this.updatedAt});
}
