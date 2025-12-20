import 'package:dio/dio.dart';
import 'package:state_management/data/models/province_response.dart';

class ProvinceRepository {
  final _dio = Dio(BaseOptions(baseUrl: 'https://open-api.my.id/api/wilayah'));

  Future<List<ProvinceResponse>> getProvince() async {
    try {
      final response = await _dio.get('/provinces');

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is List) {
          final dataList = responseData.map((item) {
            if (item is Map<String, dynamic>) {
              return ProvinceResponse.fromJson(item);
            }

            return null;
          }).toList();

          final provinceList = dataList.whereType<ProvinceResponse>().toList();

          if(provinceList.isEmpty){
            throw Exception('Failed: Province is Empty');
          }

          return provinceList;
        }
      }

      throw Exception('Failed: Province is Empty');
    } catch (e) {
      throw Exception('Failed: $e');
    }
  }
}
