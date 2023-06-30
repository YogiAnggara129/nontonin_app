import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nontonin_app/app/data/models/people_model.dart';
import 'package:nontonin_app/app/data/providers/base_provider.dart';

import '../../constants/api_constants.dart';

class PeopleProvider extends BaseProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      try {
        if (map['results'] is Map) {
          return PeopleModel.fromJson(map['results']);
        }
        if (map['results'] is List) {
          return map['results'].map((e) => PeopleModel.fromJson(e)).toList();
        }
      } catch (e) {
        printError(info: 'error di decode: $e');
        return map;
      }
    };
    super.onInit();
  }

  Future<List<PeopleModel>?> getPopular(
      {String language = 'en-US', int page = 1, String? region}) async {
    try {
      EasyLoading.show();
      final queryParams = {
        'language': language,
        'page': page.toString(),
      };
      if (region != null) queryParams['region'] = region;
      final res = await get(
        ApiConstants.popularPeople,
        query: queryParams,
      );
      EasyLoading.dismiss();
      return (res.body as List).cast<PeopleModel>();
    } catch (e) {
      printError(info: e.toString());
      Get.snackbar('Error', 'Terjadi kesalahan saat mengambil data');
      EasyLoading.dismiss();
      return null;
    }
  }
}
