import 'package:get/get.dart';
import 'package:nontonin_app/app/data/models/tv_model.dart';
import 'package:nontonin_app/app/data/providers/tv_provider.dart';

class TvController extends GetxController {
  TvController(this.tvProvider);
  final TVProvider tvProvider;
  final listTopRated = <TVModel>[].obs;
  final listOnTheAir = <TVModel>[].obs;
  final listAiringToday = <TVModel>[].obs;

  Future<void> getTopRated() async {
    final res = await tvProvider.getTopRated();
    listTopRated.assignAll(res ?? []);
  }

  Future<void> getOnTheAir() async {
    final res = await tvProvider.getOnTheAir();
    listOnTheAir.assignAll(res ?? []);
  }

  Future<void> getAiringToday() async {
    final res = await tvProvider.getAiringToday();
    listAiringToday.assignAll(res ?? []);
  }

  @override
  void onInit() {
    getTopRated();
    getOnTheAir();
    getAiringToday();
    super.onInit();
  }
}
