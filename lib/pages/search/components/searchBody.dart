import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/state_manager.dart';
import 'package:med_shield_new_version/components/dataViewerCard.dart';
import 'package:med_shield_new_version/components/emptyScreen.dart';
import 'package:med_shield_new_version/components/loading.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/search/search_controller.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/services/repositories/favourites/favourite.dart';

class SearchBody extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print(controller.filterResultList.length);
      return Expanded(
        child: AppService.to.loading.value
            ? Loading()
            : controller.filterResultList.length == 0
                ? EmptyScreen(
                    contentName: S.of(context).search,
                    type: EmptyType.isEmpty,
                  )
                : AnimationLimiter(
                    child: ListView.builder(
                      itemCount: controller.filterResultList.length,
                      controller: controller.scrollController,
                      itemBuilder: (BuildContext context, int position) {
                        return AnimationConfiguration.staggeredList(
                          position: position,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: (position ==
                                      controller.filterResultList.length - 1)
                                  ? AppService.to.errorText == 'NoNewElements'
                                      ? SizedBox.shrink()
                                      : SizedBox(
                                          height: 100.0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              CircularProgressIndicator(),
                                            ],
                                          ),
                                        )
                                  : DataViewerCard(
                                      favourite: Favourite(
                                        id: controller
                                            .filterResultList[position].id,
                                        name: controller
                                            .filterResultList[position]
                                            .serviceProviderName,
                                        specialization: controller
                                            .filterResultList[position]
                                            .specialization,
                                        area: controller
                                            .filterResultList[position].area,
                                        pageID: controller
                                            .filterResultList[position].pageID,
                                        longitude: controller
                                                    .filterResultList[position]
                                                    ?.longitude !=
                                                null
                                            ? double.tryParse(controller
                                                .filterResultList[position]
                                                .longitude)
                                            : null,
                                        latitude: controller
                                                    .filterResultList[position]
                                                    ?.latitude !=
                                                null
                                            ? double.tryParse(controller
                                                .filterResultList[position]
                                                .latitude)
                                            : null,
                                        description: controller
                                            .filterResultList[position]
                                            .specialization,
                                        address: controller
                                            .filterResultList[position].address,
                                        governorate: controller
                                            .filterResultList[position]
                                            .governorate,
                                        mobile: controller
                                            .filterResultList[position].mobile,
                                        phone_1: controller
                                            .filterResultList[position].phone1,
                                        phone_2: controller
                                            .filterResultList[position].phone2,
                                        phone_3: controller
                                            .filterResultList[position].phone3,
                                      ),
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      );
    });
  }
}
