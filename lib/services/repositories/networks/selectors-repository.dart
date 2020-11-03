import 'package:med_shield_api/model/approval_types.dart';
import 'package:med_shield_api/model/our_networks_selector.dart';
import 'package:med_shield_api/model/our_networks_selectors.dart';
import 'package:med_shield_new_version/services/repositories/management/cacheConsts.dart';
import 'package:med_shield_new_version/services/repositories/management/hive_object_extras.dart';
import 'package:med_shield_new_version/services/repositories/networks/options.dart';
import 'package:med_shield_new_version/services/repositories/networks/selectors.dart';

class SelectorsRepo extends ActiveRepo<int, Selectors> {
  @override
  String get boxName => selectorsBoxName;

  Future<List<List<OurNetworksSelector>>> getAllSelectors() async {
    List<List<OurNetworksSelector>> selectors = [];
    Selectors cachedSelectors = getValueById(0);
    List<OurNetworksSelector> area = cachedSelectors?.area == null
        ? []
        : cachedSelectors.area
            .map(
              (e) => (OurNetworksSelectorBuilder()
                    ..id = e.id
                    ..name = e.name)
                  .build(),
            )
            .toList();
    List<OurNetworksSelector> specialization =
        cachedSelectors?.specialization == null
            ? []
            : cachedSelectors.specialization
                .map(
                  (e) => (OurNetworksSelectorBuilder()
                        ..id = e.id
                        ..name = e.name)
                      .build(),
                )
                .toList();
    List<OurNetworksSelector> governorate = cachedSelectors?.governorate == null
        ? []
        : cachedSelectors.governorate
            .map(
              (e) => (OurNetworksSelectorBuilder()
                    ..id = e.id
                    ..name = e.name)
                  .build(),
            )
            .toList();
    List<OurNetworksSelector> service_provider_type =
        cachedSelectors?.service_provider_type == null
            ? []
            : cachedSelectors.service_provider_type
                .map(
                  (e) => (OurNetworksSelectorBuilder()
                        ..id = e.id
                        ..name = e.name)
                      .build(),
                )
                .toList();
    selectors.addAll([
      area,
      governorate,
      specialization,
      service_provider_type,
    ]);
    return selectors;
  }

  Future<List<ApprovalTypes>> getServiceProviderTypes() async {
    var local = dataBox.get(0, defaultValue: Selectors());
    List<ApprovalTypes> types = local?.service_provider_type == null
        ? []
        : local.service_provider_type
            .map(
              (e) => (ApprovalTypesBuilder()
                    ..id = int.tryParse(e.id)
                    ..name = e.name)
                  .build(),
            )
            .toList();
    return types;
  }

  Future<Selectors> updateCacheFromApi(OurNetworksSelectors model) async {
    var local = dataBox.get(0, defaultValue: Selectors());
    local.id = 0;
    local.area = model.area
        .map(
          (element) => Options(
            id: element.id,
            name: element.name,
          ),
        )
        .toList();
    local.specialization = model.specialization
        .map(
          (element) => Options(
            id: element.id,
            name: element.name,
          ),
        )
        .toList();
    local.governorate = model.governorate
        .map(
          (element) => Options(
            id: element.id,
            name: element.name,
          ),
        )
        .toList();
    local.service_provider_type = model.serviceProviderType
        .map(
          (element) => Options(
            id: element.id,
            name: element.name,
          ),
        )
        .toList();
    await dataBox.put(0, local);
    return local;
  }
}
