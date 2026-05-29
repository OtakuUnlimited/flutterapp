
import 'api_client.dart';

class ContentService {
  final ApiClient _client = ApiClient();

  Future<List<dynamic>> fetchVerifiedGurus() async {
    final response = await _client.get('verified-guru');
    return response['data'] ?? [];
  }

  Future<List<dynamic>> fetchOnlinePujas() async {
    final response = await _client.get('online-pujas/list');
    return response['data'] ?? [];
  }

  Future<List<dynamic>> fetchCategories() async {
    final response = await _client.get('categories');
    return response['data'] ?? [];
  }

  Future<List<dynamic>> fetchBlogs() async {
    final response = await _client.get('latest_blogs');
    return response['data'] ?? [];
  }

  Future<List<dynamic>> fetchServices() async {
    final response = await _client.get('all-service');
    return response['data'] ?? [];
  }

  Future<dynamic> fetchPatroData() async {
    return await _client.get('get-patro');
  }

  Future<dynamic> fetchGuruDetails(String slug) async {
    return await _client.get('guru-details/$slug');
  }

 Future<List<dynamic>> fetchTopDecorations() async {
    final response = await _client.get(
      'service-details/decoration',
    );

    return response['service'] ?? [];
  }

  // Popular Venues
  Future<List<dynamic>> fetchPopularVenues() async {
    final response = await _client.get(
      'service-details/venue',
    );

    return response['service'] ?? [];
  }

}