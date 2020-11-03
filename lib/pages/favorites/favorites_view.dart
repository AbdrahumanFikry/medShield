import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/dataViewerCard.dart';
import 'package:med_shield_new_version/components/emptyScreen.dart';
import 'package:med_shield_new_version/components/plainAppBar.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/favorites/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          appBar: PlainAppBar(
            barTitle: S.of(context).favourite,
            enableBack: true,
            trailingCount: controller.allFavourites?.length,
          ),
          body: controller.allFavourites.isNullOrBlank
              ? EmptyScreen()
              : ListView.builder(
                  itemCount: controller.allFavourites.length,
                  itemBuilder: (context, index) {
                    return DataViewerCard(
                      favourite: controller.allFavourites[index],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
