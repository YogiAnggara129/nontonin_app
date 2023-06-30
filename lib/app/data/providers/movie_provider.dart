import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nontonin_app/app/constants/api_constants.dart';
import 'package:nontonin_app/app/data/models/movie_model.dart';
import 'package:nontonin_app/app/data/providers/base_provider.dart';

class MovieProvider extends BaseProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      try {
        if (map['results'] is Map) {
          return MovieModel.fromJson(map['results']);
        }
        if (map['results'] is List) {
          return map['results'].map((e) => MovieModel.fromJson(e)).toList();
        }
      } catch (e) {
        printError(info: 'error di decode: $e');
        return map;
      }
    };
    super.onInit();
  }

  Future<List<MovieModel>?> getTopRated(
      {String language = 'en-US', int page = 1, String? region}) async {
    EasyLoading.show();
    try {
      final queryParams = {
        'language': language,
        'page': page.toString(),
      };
      if (region != null) queryParams['region'] = region;
      final res = await get(
        ApiConstants.topRatedMovies,
        query: queryParams,
      );
      EasyLoading.dismiss();
      return (res.body as List).cast<MovieModel>();
    } catch (e) {
      printError(info: e.toString());
      Get.snackbar('Error', 'Terjadi kesalahan saat mengambil data');
      EasyLoading.dismiss();
      return null;
    }
  }

  Future<List<MovieModel>?> getUpcoming(
      {String language = 'en-US', int page = 1, String? region}) async {
    EasyLoading.show();
    try {
      final queryParams = {
        'language': language,
        'page': page.toString(),
      };
      if (region != null) queryParams['region'] = region;
      final res = await get(
        ApiConstants.upcomingMovies,
        query: queryParams,
      );
      EasyLoading.dismiss();
      return (res.body as List).cast<MovieModel>();
    } catch (e) {
      printError(info: e.toString());
      Get.snackbar('Error', 'Terjadi kesalahan saat mengambil data');
      EasyLoading.dismiss();
      return null;
    }
  }

  Future<List<MovieModel>?> getNowPlaying(
      {String language = 'en-US', int page = 1, String? region}) async {
    EasyLoading.show();
    try {
      final queryParams = {
        'language': language,
        'page': page.toString(),
      };
      if (region != null) queryParams['region'] = region;
      final res = await get(
        ApiConstants.nowPlayingMovies,
        query: queryParams,
      );
      EasyLoading.dismiss();
      return (res.body as List).cast<MovieModel>();
    } catch (e) {
      printError(info: e.toString());
      Get.snackbar('Error', 'Terjadi kesalahan saat mengambil data');
      EasyLoading.dismiss();
      return null;
    }
  }

  Future<List<MovieModel>?> getPopular(
      {String language = 'en-US', int page = 1, String? region}) async {
    EasyLoading.show();
    try {
      final queryParams = {
        'language': language,
        'page': page.toString(),
      };
      if (region != null) queryParams['region'] = region;
      final res = await get(
        ApiConstants.popularMovies,
        query: queryParams,
      );
      EasyLoading.dismiss();
      return (res.body as List).cast<MovieModel>();
    } catch (e) {
      printError(info: e.toString());
      Get.snackbar('Error', 'Terjadi kesalahan saat mengambil data');
      EasyLoading.dismiss();
      return null;
    }
  }
}
