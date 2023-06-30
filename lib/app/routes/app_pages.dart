import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_item/bindings/list_item_binding.dart';
import '../modules/list_item/views/list_item_view.dart';
import '../modules/movie/bindings/movie_binding.dart';
import '../modules/movie/views/movie_view.dart';
import '../modules/navigator/bindings/navigator_binding.dart';
import '../modules/navigator/views/navigator_view.dart';
import '../modules/popular/bindings/popular_binding.dart';
import '../modules/popular/views/popular_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tv/bindings/tv_binding.dart';
import '../modules/tv/views/tv_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE,
      page: () => const MovieView(),
      binding: MovieBinding(),
    ),
    GetPage(
      name: _Paths.TV,
      page: () => const TvView(),
      binding: TvBinding(),
    ),
    GetPage(
      name: _Paths.POPULAR,
      page: () => const PopularView(),
      binding: PopularBinding(),
    ),
    GetPage(
      name: _Paths.LIST_ITEM,
      page: () => const ListItemView(),
      binding: ListItemBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATOR,
      page: () => const NavigatorView(),
      binding: NavigatorBinding(),
    ),
  ];
}
