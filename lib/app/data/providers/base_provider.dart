import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_utils/get_utils.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = dotenv.env['BASE_URL'];
    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = 'Bearer ${dotenv.env["TOKEN"]}';
      printInfo(info: 'url: ${request.url}');
      return request;
    });
    super.onInit();
  }
}