import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nontonin_app/app/data/models/tv_model.dart';
import 'package:nontonin_app/app/data/providers/base_provider.dart';

import '../../constants/api_constants.dart';

class TVProvider extends BaseProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      try {
        if (map['results'] is Map<String, dynamic>) {
          return TVModel.fromJson(map['results']);
        }
        if (map['results'] is List) {
          return map['results'].map((e) => TVModel.fromJson(e)).toList();
        }
      } catch (e) {
        printError(info: 'error di decode: $e');
        return map;
      }
    };
    super.onInit();
  }

  Future<List<TVModel>?> getPopular(
      {String language = 'en-US', int page = 1, String? region}) async {
    try {
      EasyLoading.show();
      final queryParams = {
        'language': language,
        'page': page.toString(),
      };
      if (region != null) queryParams['region'] = region;
      final res = await get(
        ApiConstants.popularTV,
        query: queryParams,
      );
      EasyLoading.dismiss();
      return (res.body as List).cast<TVModel>();
    } catch (e) {
      printError(info: e.toString());
      Get.snackbar('Error', 'Terjadi kesalahan saat mengambil data');
      EasyLoading.dismiss();
      return null;
    }
  }

  Future<List<TVModel>?> getTopRated(
      {String language = 'en-US', int page = 1, String? region}) async {
    try {
      EasyLoading.show();
      final queryParams = {
        'language': language,
        'page': page.toString(),
      };
      if (region != null) queryParams['region'] = region;
      final res = await get(
        ApiConstants.topRatedTV,
        query: queryParams,
      );
      EasyLoading.dismiss();
      return (res.body as List).cast<TVModel>();
    } catch (e) {
      printError(info: e.toString());
      Get.snackbar('Error', 'Terjadi kesalahan saat mengambil data');
      EasyLoading.dismiss();
      return null;
    }
  }

  Future<List<TVModel>?> getOnTheAir(
      {String language = 'en-US', int page = 1, String? region}) async {
    try {
      EasyLoading.show();
      final queryParams = {
        'language': language,
        'page': page.toString(),
      };
      if (region != null) queryParams['region'] = region;
      final res = await get(
        ApiConstants.onTheAirTV,
        query: queryParams,
      );
      EasyLoading.dismiss();
      return (res.body as List).cast<TVModel>();
    } catch (e) {
      printError(info: e.toString());
      Get.snackbar('Error', 'Terjadi kesalahan saat mengambil data');
      EasyLoading.dismiss();
      return null;
    }
  }

  Future<List<TVModel>?> getAiringToday(
      {String language = 'en-US', int page = 1, String? region}) async {
    try {
      EasyLoading.show();
      final queryParams = {
        'language': language,
        'page': page.toString(),
      };
      if (region != null) queryParams['region'] = region;
      final res = await get(
        ApiConstants.airingTodayTV,
        query: queryParams,
      );
      EasyLoading.dismiss();
      return (res.body as List).cast<TVModel>();
    } catch (e) {
      printError(info: e.toString());
      Get.snackbar('Error', 'Terjadi kesalahan saat mengambil data');
      EasyLoading.dismiss();
      return null;
    }
  }
}
