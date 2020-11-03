import 'package:flutter/material.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/plainAppBar.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class DiscountCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          appBar: PlainAppBar(
            barTitle: S.of(context).discountCard,
            enableBack: true,
          ),
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowGlow();
              return true;
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              children: <Widget>[
                Text(
                  " It’s important for you to understand that health discount cards are not health insurance.\n\n Health discount cards are strictly discount programs that give you and your family preferred rates from selected health-care providers.\n\n However, health discount cards may provide you with a valuable, inexpensive alternative or supplement to a standard health insurance plan, especially when paired with other supplemental medical insurance products.\n\n Your health discount card membership will become active as soon as you receive your card in the mail.\n\n Depending on the company you choose, this may be one to two weeks after completion of the application You can apply for your own health discount card on MEDSHIELD.\n\n Apply now and start enjoying savings on your health-care services.",
                  style: TextStyle(
                    color: ColorUtil.greyColor,
                    fontSize: 38.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
