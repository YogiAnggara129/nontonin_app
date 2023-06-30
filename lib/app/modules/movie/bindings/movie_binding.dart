import 'package:get/get.dart';
import 'package:nontonin_app/app/data/providers/movie_provider.dart';

import '../controllers/movie_controller.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieProvider>(() => MovieProvider());
    Get.lazyPut<MovieController>(
      () => MovieController(Get.find()),
    );
  }
}
