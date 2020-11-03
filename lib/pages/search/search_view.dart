import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/appInputField.dart';
import 'package:med_shield_new_version/components/plainAppBar.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/search/components/filterDrawer.dart';
import 'package:med_shield_new_version/pages/search/components/searchBody.dart';
import 'package:med_shield_new_version/pages/search/search_controller.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          key: controller.scaffoldKey,
          appBar: PlainAppBar(
            barTitle: S.of(context).search,
            enableBack: true,
            trailing: GestureDetector(
              onTap: () => controller.scaffoldKey.currentState.openEndDrawer(),
              child: Icon(
                FontAwesomeIcons.filter,
                color: ColorUtil.primaryColor,
                size: 20.0,
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Obx(
                () => AppInputField(
                  controller: controller.textController,
                  onFieldSubmitted: (String value) {
                    controller.searchText.value = value;
                    controller.onSearchTextConfirmed();
                    controller.searchFocus?.unfocus();
                  },
                  onChanged: (String value) {
                    controller.searchText.value = value;
                    EasyDebounce.debounce(
                      'searchDebouncer',
                      Duration(seconds: 1),
                      () {
                        print('::::::::::::::::  Debounce  :::::::::::::::::');
                        controller.onSearchTextConfirmed();
                        // controller.searchFocus?.unfocus();
                      },
                    );
                  },
                  loading: AppService.to.loading.value,
                  hintText: S.of(context).searchOurNetwork,
                  suffixIcon: FontAwesomeIcons.search,
                ),
              ),
              SearchBody(),
            ],
          ),
          endDrawer: FilterDrawer(),
        ),
      ),
    );
  }
}
