import 'package:dio/dio.dart';
import '../model/movie_model.dart';

class ApiService {
  final Dio _dio;

  static const String _baseUrl = 'https://api.themoviedb.org/3';

  static const String _accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MzBhYWJlMjYyYTRhMzU3MjE2OWI3OTk5OGE3NzA0MiIsIm5iZiI6MTc2NTQyNjMwMi4yMTUwMDAyLCJzdWIiOiI2OTNhNDQ3ZWM5ZjU5OWQzNTQxZmYyMDUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.n4QFjrQ-dfz8DxikUinGwuXzgY_vFeRudJ9bK9GlB7E';

  ApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          headers: {
            'Authorization': 'Bearer $_accessToken',
            'Content-Type': 'application/json',
          },
        ),
      );

  Future<List<Movie>> fetchPopularMovies({required int page}) async {
    try {
      final response = await _dio.get(
        '/movie/popular',
        queryParameters: {'page': page},
      );

      final List<dynamic> results = response.data['results'];

      return results.map((json) => Movie.fromJson(json)).toList();
    } on DioException catch (e) {
      String errorMessage = 'Terjadi kesalahan pada jaringan.';
      if (e.response != null) {
        errorMessage =
            'Kesalahan API: ${e.response!.statusCode} - ${e.response!.statusMessage}';
      }
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Gagal memuat film: $e');
    }
  }

  Future<Map<String, dynamic>> fetchMovieDetail(int movieId) async {
    try {
      final response = await _dio.get('/movie/$movieId');
      return response.data;
    } on DioException catch (e) {
      throw Exception('Gagal memuat detail film: ${e.message}');
    }
  }
}
