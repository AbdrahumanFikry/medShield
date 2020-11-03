import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/plainAppBar.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/profile/components/customSliverDelegate.dart';
import 'package:med_shield_new_version/pages/profile/components/profileInfo.dart';
import 'package:med_shield_new_version/pages/profile/editProfile.dart';
import 'package:med_shield_new_version/pages/profile/profile_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final userData = AppService.to.user?.value;
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          appBar: PlainAppBar(
            barTitle: S.of(context).profile,
            enableBack: true,
            trailing: IconButton(
              icon: Icon(
                FontAwesomeIcons.userEdit,
                size: 45.sp,
                color: ColorUtil.greyColor,
              ),
              onPressed: () => Get.off(
                EditProfile(),
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: CustomSliverDelegate(
                  expandedHeight: 250.h,
                  imagePath: userData?.image,
                  hideTitleWhenExpanded: false,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Column(
                        children: <Widget>[
                          ProfileInfo(
                            icon: FontAwesomeIcons.user,
                            title: S.of(context).name,
                            content: userData?.name ?? '',
                          ),
                          ProfileInfo(
                            icon: FontAwesomeIcons.briefcaseMedical,
                            title: S.of(context).company,
                            content: userData?.company_name ?? '',
                          ),
                          ProfileInfo(
                            icon: FontAwesomeIcons.addressCard,
                            title: S.of(context).medicalIdNumber ?? '',
                            content: userData?.medicalId,
                          ),
                          ProfileInfo(
                            icon: FontAwesomeIcons.calendar,
                            title: S.of(context).birthDate,
                            content: userData?.date_of_birth ?? '',
                          ),
                          ProfileInfo(
                            icon: FontAwesomeIcons.venusMars,
                            title: S.of(context).gender,
                            content: userData?.gender ?? '',
                          ),
                          ProfileInfo(
                            icon: FontAwesomeIcons.phone,
                            title: S.of(context).phoneNumber,
                            content: userData?.phone ?? '',
                          ),
                          ProfileInfo(
                            icon: FontAwesomeIcons.envelope,
                            title: S.of(context).email,
                            content: userData?.email ?? '',
                          ),
                          ProfileInfo(
                            icon: FontAwesomeIcons.pills,
                            title: S.of(context).medication,
                            content: userData?.medication ?? '',
                          ),
                          ProfileInfo(
                            icon: FontAwesomeIcons.handHoldingMedical,
                            title: S.of(context).insuranceType,
                            content: userData?.insurance_type ?? '',
                          ),
                          ProfileInfo(
                            icon: FontAwesomeIcons.calendarPlus,
                            title: S.of(context).startDate,
                            content: userData?.start_date ?? '',
                          ),
                          ProfileInfo(
                            icon: FontAwesomeIcons.calendarMinus,
                            title: S.of(context).endDate,
                            content: userData?.end_date ?? '',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
