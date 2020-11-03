import 'package:med_shield_new_version/pages/settings/settings_binding.dart';
import 'package:med_shield_new_version/pages/settings/settings_view.dart';

import '../pages/chat/chat_view.dart';
import '../pages/chat/chat_binding.dart';
import '../pages/discount_card/discount_card_view.dart';
import '../pages/about_us/about_us_view.dart';
import '../pages/favorites/favorites_view.dart';
import '../pages/favorites/favorites_binding.dart';
import '../pages/service/service_view.dart';
import '../pages/service/service_binding.dart';
import '../pages/profile/profile_view.dart';
import '../pages/profile/profile_binding.dart';
import '../pages/approval/approval_view.dart';
import '../pages/approval/approval_binding.dart';
import '../pages/network/network_view.dart';
import '../pages/network/network_binding.dart';
import '../pages/search/search_view.dart';
import '../pages/search/search_binding.dart';
import '../pages/notifications/notifications_view.dart';
import '../pages/notifications/notifications_binding.dart';
import '../pages/auth/auth_view.dart';
import '../pages/auth/auth_binding.dart';
import '../pages/main/main_view.dart';
import '../pages/main/main_binding.dart';
import '../pages/select_language/select_language_view.dart';
import '../pages/select_language/select_language_binding.dart';
import '../pages/splash/splash_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
    ),
    GetPage(
      name: Routes.SELECT_LANGUAGE,
      page: () => SelectLanguageView(),
      binding: SelectLanguageBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.NETWORK,
      page: () => NetworkView(),
      binding: NetworkBinding(),
    ),
    GetPage(
      name: Routes.APPROVAL,
      page: () => ApprovalView(),
      binding: ApprovalBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.SERVICE,
      page: () => ServiceView(),
      binding: ServiceBinding(),
    ),
    GetPage(
      name: Routes.FAVORITES,
      page: () => FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: Routes.ABOUT_US,
      page: () => AboutUsView(),
    ),
    GetPage(
      name: Routes.DISCOUNT_CARD,
      page: () => DiscountCardView(),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
