// lib/services/content_service.dart
import 'api_client.dart';

class ContentService {
  final ApiClient _client = ApiClient();

  // Fetches data for your updated HomeScreen/FindGurus layout
  Future<List<dynamic>> fetchVerifiedGurus() async {
    final response = await _client.get('verified-guru');
    return response['data'] ?? [];
  }

  Future<List<dynamic>> fetchOnlinePujas() async {
    final response = await _client.get('online-pujas/list');
    return response['data'] ?? [];
  }

  Future<dynamic> fetchPatroData() async {
    return await _client.get('get-patro');
  }

  Future<dynamic> fetchGuruDetails(String slug) async {
    return await _client.get('guru-details/$slug');
  }
}