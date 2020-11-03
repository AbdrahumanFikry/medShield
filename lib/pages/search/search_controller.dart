import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:med_shield_api/api.dart';
import 'package:med_shield_api/model/our_networks.dart';
import 'package:med_shield_api/model/our_networks_response.dart';
import 'package:med_shield_api/model/our_networks_selector.dart';
import 'package:med_shield_api/model/our_networks_selectors_response.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/utilities/apiUtil.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';

class SearchController extends GetxController {
  final filtersFetched = false.obs;
  final CacheService cacheController;
  final selectedApprovalTypes = RxList<String>([null, null, null, null]);
  final approvalTypes = RxList<List<OurNetworksSelector>>([[], [], [], []]);
  final isEmpty = false.obs;
  final List<String> placeHolder = [
    S.current.area,
    S.current.governorate,
    S.current.specialization,
    S.current.approvalType,
  ];
  TextEditingController textController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final searchText = ''.obs;
  final filterResultList = RxList<OurNetworks>([]);
  final filterResultListCopy = RxList<OurNetworks>([]);
  FocusNode searchFocus;
  final page = 1.obs;
  ScrollController scrollController;
  Position position;

  // final posts = RxList<int>([]);
  final maxResults = RxList<int>([]);

  SearchController(
    this.cacheController,
  );

  MedShieldApi get api => Get.find();

  int get wordCount {
    int wordCount = 25;
    if (Get.width >= 350 && Get.width <= 530) {
      wordCount = 36;
    } else if (Get.width > 430 && Get.width < 500) {
      wordCount = 60;
    }
    return wordCount;
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
    _setupScrollController();
    maxResults.addAll(List.generate(8000, (x) => x));
    fetchFilterResult();
    getAllFilters();
  }

  @override
  onClose() {
    AppService.to.endService();
    super.onClose();
  }

  void _setupScrollController() {
    textController = TextEditingController()
      ..addListener(() {
        final txt = textController.text;
        // if (txt.length == 0) {
        //   // posts.clear();
        //   filterResultList.clear();
        // }
      });
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void onSearchTextConfirmed() {
    if (AppService.to.isAuth) {
      if (textController.text.isNotEmpty) {
        // posts.clear();
        filterResultList.clear();
        page.value = 1;
        fetchFilterResult();
      }
    } else {
      AppUtil.showAlertDialog(
        title: S.current.alert,
        confirmText: S.current.signIn,
        body: S.current.notAuth,
        enableCancel: true,
        onConfirm: () {
          Get.offAllNamed(Routes.AUTH);
        },
      );
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
    if (page.value == 1) AppService.to.startNewService();
    print('PageId : ' + page.value.toString());
    print('Search about : ' + searchText.value);
    try {
      position = await AppUtil.getLocation();
      OurNetworksResponse response = await APIUtil.request<OurNetworksResponse>(
        future: api.getNetworksApi().networks(APIUtil.apiToken,
            pageID: page.value ?? 1,
            appUserId: 0,
            lat: position.latitude.toString() ?? null,
            lng: position.longitude.toString() ?? null,
            area: selectedApprovalTypes[0]?.toString() ?? ' ',
            governorate: selectedApprovalTypes[1]?.toString() ?? ' ',
            specialization: selectedApprovalTypes[2]?.toString() ?? ' ',
            serviceProviderType: selectedApprovalTypes[3]?.toString() ?? ' ',
            search: searchText.value),
      );
      int oldCount = filterResultList.length;
      if (page.value == 1) {
        filterResultList.value = response.result.toList();
        AppService.to.endService();
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
