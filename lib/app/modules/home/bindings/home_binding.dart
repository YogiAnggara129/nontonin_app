import 'package:get/get.dart';
import 'package:nontonin_app/app/data/providers/base_provider.dart';
import 'package:nontonin_app/app/data/providers/movie_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieProvider>(() => MovieProvider());
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find()),
    );
  }
}
