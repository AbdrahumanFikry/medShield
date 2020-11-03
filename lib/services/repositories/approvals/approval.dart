import 'package:hive/hive.dart';
import 'package:med_shield_new_version/services/repositories/approvals/approvalComments.dart';
import 'package:med_shield_new_version/services/repositories/approvals/file.dart';
import 'package:med_shield_new_version/services/repositories/management/cacheConsts.dart';

part 'approval.g.dart';

@HiveType(typeId: approvalCacheId)
class ApprovalDto {
  @HiveField(0)
  int id;

  @HiveField(1)
  String statues;

  @HiveField(2)
  String employee_number;

  @HiveField(3)
  String company_name;

  @HiveField(4)
  String provider_name;

  @HiveField(5)
  String title;

  @HiveField(6)
  String more_details;

  @HiveField(7)
  int replay_by;

  @HiveField(8)
  List<FileDto> files;

  @HiveField(9)
  List<ApprovalCommentsDto> approval_comments;

  @HiveField(10)
  DateTime add_date;

  @HiveField(11)
  DateTime updatedAt;

  @HiveField(12)
  DateTime createdAt;

  @HiveField(13)
  DateTime deletedAt;

  ApprovalDto({
    this.id,
    this.title,
    this.statues,
    this.company_name,
    this.employee_number,
    this.more_details,
    this.provider_name,
    this.replay_by,
    this.files,
    this.approval_comments,
    this.add_date,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
  });
}
