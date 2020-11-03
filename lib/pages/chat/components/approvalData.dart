import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/chat/components/imageViewer.dart';
import 'package:med_shield_new_version/pages/chat/components/pdfHandler.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/services/repositories/approvals/file.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class ApprovalData extends StatelessWidget {
  final String id;
  final String from;
  final String email;
  final String name;
  final String gender;
  final String dateOfBirth;
  final String companyName;
  final String title;
  final DateTime addDate;
  final List<FileDto> files;

  ApprovalData({
    this.id = '',
    this.name = '',
    this.title = '',
    this.files,
    this.addDate,
    this.companyName = '',
    this.from = '',
    this.dateOfBirth = '',
    this.gender = '',
    this.email = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 5.0,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        color: ColorUtil.primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).approvalId + ' : ' + id,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.end,
          ),
          Text(
            S.of(context).name + ' : ' + AppService.to?.user?.value?.name ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.end,
          ),
          Text(
            S.of(context).approvalTitle + ' : ' + title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.end,
          ),
          Text(
            S.of(context).company + ' : ' + companyName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.end,
          ),
          Text(
            S.of(context).date + ' : ' + DateFormat.yMd().format(addDate),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.end,
          ),
          const SizedBox(
            height: 5.0,
          ),
          ListView.builder(
            itemCount: files.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return files[index].fileLink.contains('pdf')
                  ? PdfHandler(
                      files[index].fileLink,
                      files[index].fileName,
                      true,
                    )
                  : GestureDetector(
                      onTap: () => Get.to(
                        ImageViewer(
                          id: files[index].id,
                          image: files[index].fileLink,
                        ),
                      ),
                      child: Hero(
                        tag: files[index].id,
                        child: Image.network(
                          files[index].fileLink,
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
