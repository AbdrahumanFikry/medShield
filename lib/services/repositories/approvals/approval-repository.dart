import 'package:med_shield_api/model/approval.dart';
import 'package:med_shield_api/model/approval_files.dart';
import 'package:med_shield_api/model/approval_replay.dart';
import 'package:med_shield_api/model/approval_replay_files.dart';
import 'package:med_shield_new_version/services/repositories/approvals/approval.dart';
import 'package:med_shield_new_version/services/repositories/approvals/approvalComments.dart';
import 'package:med_shield_new_version/services/repositories/approvals/file.dart';
import 'package:med_shield_new_version/services/repositories/management/cacheConsts.dart';
import 'package:med_shield_new_version/services/repositories/management/hive_object_extras.dart';

enum Statues {
  Old,
  New,
}

class ApprovalRepo extends ActiveRepo<int, ApprovalDto> {
  @override
  String get boxName => approvalBoxName;

  ApprovalCommentsDto fromComment(ApprovalReplay replay) {
    return ApprovalCommentsDto(
      replay_with: replay.replayWith != 'admin' ? 'me' : 'other',
      comment: replay.comment,
      id: replay.id,
      files: replay.files?.map(fromReplayFile)?.toList() ?? [],
      approvalId: replay.approvalId,
      admin_name: replay.adminName,
      app_user_name: replay.appUserName,
      updatedAt: replay.updatedAt,
    );
  }

  FileDto fromApprovalFile(ApprovalFiles file) {
    return FileDto(
      id: file.id,
      fileLink: file.fileLink,
      approvalId: file.approvalId,
      fileType: file.fileType,
      fileName: file.fileName,
      fileDir: file.fileDir,
      file: file.file,
    );
  }

  FileDto fromReplayFile(ApprovalReplayFiles file) {
    return FileDto(
      id: file.id,
      fileLink: file.fileLink,
      approvalId: file.approvalId,
      fileType: file.fileType,
      fileName: file.fileName,
      fileDir: file.fileDir,
      file: file.file,
    );
  }

  DateTime getLatestDate(ApprovalDto approval) {
    DateTime res = approval.updatedAt;
    for (var comment in approval.approval_comments) {
      if (comment.updatedAt != null && comment.updatedAt.isAfter(res)) {
        res = comment.updatedAt;
      }
    }
    return res;
  }

  Future<ApprovalDto> addToApprovals(Approval approval) async {
    var localApprovals = getAllValues();
    String statues = 'old';
    int index =
        localApprovals.indexWhere((element) => element.id == approval.id);

    List<FileDto> files = approval.files == null
        ? []
        : approval.files.map(fromApprovalFile).toList();
    List<ApprovalCommentsDto> approvalComments =
        approval.approvalComments == null
            ? []
            : approval.approvalComments.map(fromComment).toList();
    ApprovalDto local = ApprovalDto(
      id: approval.id,
      title: approval.title,
      company_name: approval.companyName,
      more_details: approval.moreDetails,
      provider_name: approval.providerName,
      employee_number: approval.employeeNumber,
      add_date: approval.addDate,
      files: files,
      approval_comments: approvalComments,
      createdAt: approval.createdAt,
      deletedAt: approval.deletedAt,
      updatedAt: approval.updatedAt,
    );
    if (index != null && index != -1) {
      if (getLatestDate(local).isAfter(getLatestDate(localApprovals[index]))) {
        local.statues = 'new';
      } else {
        local.statues = 'old';
      }
    }
    await dataBox.put(approval.id, local);
    return local;
  }

  Future<void> updateStatues(
    int approvalId, {
    Statues statues = Statues.Old,
  }) async {
    ApprovalDto approval = await getValueById(approvalId);
    approval.statues = statues == Statues.Old ? 'old' : 'new';
    return dataBox.put(approvalId, approval);
  }
}
