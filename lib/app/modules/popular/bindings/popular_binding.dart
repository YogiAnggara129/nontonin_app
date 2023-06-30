import 'package:get/get.dart';
import 'package:nontonin_app/app/data/providers/movie_provider.dart';
import 'package:nontonin_app/app/data/providers/people_provider.dart';
import 'package:nontonin_app/app/data/providers/tv_provider.dart';

import '../controllers/popular_controller.dart';

class PopularBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieProvider>(() => MovieProvider());
    Get.lazyPut<TVProvider>(() => TVProvider());
    Get.lazyPut<PeopleProvider>(() => PeopleProvider());
    Get.lazyPut<PopularController>(
      () => PopularController(Get.find(), Get.find(), Get.find()),
    );
  }
}
