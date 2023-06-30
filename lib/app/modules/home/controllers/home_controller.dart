import 'package:get/get.dart';
import 'package:nontonin_app/app/data/providers/movie_provider.dart';

class HomeController extends GetxController {
  HomeController(this.movieProvider);
  final MovieProvider movieProvider;

  final count = 0.obs;
  @override
  void onInit() async {
    movieProvider.getTopRated();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
