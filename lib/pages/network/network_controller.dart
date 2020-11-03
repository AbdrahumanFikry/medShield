import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:med_shield_api/api.dart';
import 'package:med_shield_api/model/our_networks.dart';
import 'package:med_shield_api/model/our_networks_response.dart';
import 'package:med_shield_api/model/our_networks_selector.dart';
import 'package:med_shield_api/model/our_networks_selectors_response.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/network/filterResult.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/utilities/apiUtil.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';

class NetworkController extends GetxController {
  final filtersFetched = false.obs;
  final CacheService cacheController;
  final approvalTypes = RxList<List<OurNetworksSelector>>([[], [], [], []]);
  final isEmpty = false.obs;
  final List<String> placeHolder = [
    S.current.area,
    S.current.governorate,
    S.current.specialization,
    S.current.approvalType,
  ];
  final selectedApprovalTypes = RxList<String>([null, null, null, null]);
  TextEditingController textController = TextEditingController();
  final filterResultList = RxList<OurNetworks>([]);
  FocusNode searchFocus;
  final page = 1.obs;
  ScrollController scrollController;
  Position position;

  NetworkController(
    this.cacheController,
  );

  int get wordCount {
    int wordCount = 35;
    if (Get.width >= 350 && Get.width <= 530) {
      wordCount = 42;
    } else if (Get.width > 430 && Get.width < 500) {
      wordCount = 60;
    }
    return wordCount;
  }

  final maxResults = RxList<int>([]);

  MedShieldApi get api => Get.find();

  Future<void> getAllFilters() async {
    try {
      OurNetworksSelectorsResponse response =
          await APIUtil.request<OurNetworksSelectorsResponse>(
        future: api.getNetworksApi().networksSelectors(APIUtil.apiToken),
      );
      approvalTypes[0] = response.result.area.toList();
      approvalTypes[1] = response.result.governorate.toList();
      approvalTypes[2] = response.result.specialization.toList();
      approvalTypes[3] = response.result.serviceProviderType.toList();
      isEmpty.value = checkIsEmpty([
        approvalTypes[0],
        approvalTypes[1],
        approvalTypes[2],
        approvalTypes[3],
      ]);
      await cacheController.selectorsRepo.updateCacheFromApi(response.result);
      filtersFetched.value = true;
    } catch (error) {
      List<List<OurNetworksSelector>> allCachedFilters =
          await cacheController.selectorsRepo.getAllSelectors();
      if (allCachedFilters != null && allCachedFilters.length == 4) {
        isEmpty.value = checkIsEmpty(allCachedFilters);
        approvalTypes.value = allCachedFilters;
        filtersFetched.value = true;
      } else {
        AppUtil.showAlertDialog(body: error.toString());
      }
    }
  }

  String getTypeId({String type, List<OurNetworksSelector> targetList}) {
    final typeObj = targetList.firstWhere((element) => element.name == type);
    return typeObj.id;
  }

  @override
  void onInit() {
    filtersFetched.value = false;
    _setupScrollController();
    maxResults.addAll(List.generate(8000, (x) => x));
    getAllFilters();
  }

  @override
  onClose() {
    filtersFetched.value = false;
    AppService.to.endService();
    super.onClose();
  }

  bool checkIsEmpty(List<List<OurNetworksSelector>> data) {
    if (data[0].isEmpty &&
        data[1].isEmpty &&
        data[2].isEmpty &&
        data[3].isEmpty) {
      return true;
    }
    return false;
  }

  void _setupScrollController() {
    textController = TextEditingController()
      ..addListener(() {
        final txt = textController.text;
        if (txt.length == 0) {
          // posts.clear();
          filterResultList.clear();
        }
      });
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void onSearchTextConfirmed() {
    if (textController.text.isNotEmpty) {
      // posts.clear();
      filterResultList.clear();
      page.value = 1;
      fetchFilterResult();
    }
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      page.value = page.value + 1;
      fetchFilterResult();
      print('Items count : ' + filterResultList.length.toString());
    } else {
      print('End of list');
      print('Items count : ' + filterResultList.length.toString());
    }
  }

  Future<void> fetchFilterResult() async {
    AppService.to.startNewService();

    try {
      print('PageId : ' + page.value.toString());
      print('Area : ' + selectedApprovalTypes[0].toString() ?? ' ');
      print('Governorate : ' + selectedApprovalTypes[1].toString() ?? ' ');
      print('Specialization : ' + selectedApprovalTypes[2].toString() ?? ' ');
      print('Service provider type : ' + selectedApprovalTypes[3].toString() ??
          ' ');
      position = await AppUtil.getLocation();
      OurNetworksResponse response = await APIUtil.request<OurNetworksResponse>(
        future: api.getNetworksApi().networks(APIUtil.apiToken,
            pageID: page.value ?? 1,
            appUserId: 0,
            lat: position.latitude.toString() ?? ' ',
            lng: position.longitude.toString() ?? ' ',
            area: selectedApprovalTypes[0]?.toString() ?? ' ',
            governorate: selectedApprovalTypes[1]?.toString() ?? ' ',
            specialization: selectedApprovalTypes[2]?.toString() ?? ' ',
            serviceProviderType: selectedApprovalTypes[3]?.toString() ?? ' ',
            search: null),
      );
      int oldCount = filterResultList.length;
      if (page.value == 1) {
        filterResultList.value = response.result.toList();
        AppService.to.endService();
        Get.to(
          FilterResult(),
          transition: Transition.fade,
        );
      } else {
        filterResultList.addAll(response.result.toList());
        if (filterResultList.length == oldCount) {
          AppService.to.endServiceWithError('NoNewElements');
        } else {
          AppService.to.endService();
        }
      }
    } catch (error) {
      AppUtil.showAlertDialog(body: error.toString());
      AppService.to.endService();
    }
  }
}
