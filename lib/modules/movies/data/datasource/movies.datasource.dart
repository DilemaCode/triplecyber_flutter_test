import 'package:dio/dio.dart';
import 'package:triplecyber_test/common/config.dart';

class MoviesDatasource {
  final dio = Dio();
  Future<Map<String, dynamic>> getMovies() async {
    final response = await dio.get<Map<String, dynamic>>('${AppConfig.API_URL}?api_key=${AppConfig.API_KEY}&language=en-US&page=1');
    return response.data as Map<String, dynamic>;
  }
}
