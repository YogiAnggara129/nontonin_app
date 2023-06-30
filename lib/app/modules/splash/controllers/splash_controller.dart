import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  void start() {
    Future.delayed(
      const Duration(seconds: 1),
      () async => Get.offAllNamed(Routes.NAVIGATOR),
    );
  }
}
