import 'package:get/get.dart';
import 'package:nontonin_app/app/data/models/movie_model.dart';
import 'package:nontonin_app/app/data/providers/movie_provider.dart';

class MovieController extends GetxController {
  MovieController(this.movieProvider);
  final MovieProvider movieProvider;
  final listTopRated = <MovieModel>[].obs;
  final listUpcoming = <MovieModel>[].obs;
  final listNowPlaying = <MovieModel>[].obs;

  Future<void> getTopRated({page}) async {
    final res = await movieProvider.getTopRated();
    listTopRated.assignAll(res ?? []);
  }

  Future<void> getUpcoming() async {
    final res = await movieProvider.getUpcoming();
    listUpcoming.assignAll(res ?? []);
  }

  Future<void> getNowPlaying() async {
    final res = await movieProvider.getNowPlaying();
    listNowPlaying.assignAll(res ?? []);
  }

  @override
  void onInit() {
    getTopRated();
    getUpcoming();
    getNowPlaying();
    super.onInit();
  }
}
