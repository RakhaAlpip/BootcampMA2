import 'package:get/get.dart';
import 'package:state_management/data/models/province_response.dart';

class RestApi extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://open-api.my.id/api/wilayah';
  }

  Future<List<ProvinceResponse>> getProvinces() async {
    final response = await get('/province');
    if (response.statusCode == 200) {
      return response.body['data']
          .map<ProvinceResponse>((json) => ProvinceResponse.fromJson(json))
          .toList();
    } else {
      return [];
    }
  }
}