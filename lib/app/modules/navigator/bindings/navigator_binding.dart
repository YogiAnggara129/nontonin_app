import 'package:get/get.dart';
import 'package:nontonin_app/app/modules/movie/bindings/movie_binding.dart';
import 'package:nontonin_app/app/modules/popular/bindings/popular_binding.dart';
import 'package:nontonin_app/app/modules/tv/bindings/tv_binding.dart';

import '../controllers/navigator_controller.dart';

class NavigatorBinding extends Bindings {
  @override
  void dependencies() {
    MovieBinding().dependencies();
    TvBinding().dependencies();
    PopularBinding().dependencies();
    Get.lazyPut<NavigatorController>(
      () => NavigatorController(),
    );
  }
}
