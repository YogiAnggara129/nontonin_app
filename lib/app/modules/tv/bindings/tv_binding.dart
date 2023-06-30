import 'package:get/get.dart';
import 'package:nontonin_app/app/data/providers/tv_provider.dart';

import '../controllers/tv_controller.dart';

class TvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TVProvider>(() => TVProvider());
    Get.lazyPut<TvController>(
      () => TvController(Get.find()),
    );
  }
}
