import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiClient {
  // Replace with your real production domain or local IP (e.g., http://10.0.2.2:8000 for local android simulation)"http://192.168.101.1:8000/api"
  static const String baseUrl = "http://10.0.2.2:8000/api";
  
  // Persistent local cache memory property for holding the Sanctum token
  static String? _token;

  // Set this immediately upon a successful user login or application splash check
  static void setToken(String token) {
    _token = token;
  }

  static void clearToken() {
    _token = null;
  }

  // Base Headers Builder
  Map<String, String> _getHeaders({bool requireAuth = false}) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (requireAuth && _token != null) 'Authorization': 'Bearer $_token',
    };
  }

  // HTTP GET Handler
  Future<dynamic> get(String endpoint, {bool requireAuth = false}) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    try {
      final response = await http.get(url, headers: _getHeaders(requireAuth: requireAuth));
      return _processResponse(response);
    } catch (e) {
      throw Exception("Network connectivity failed: $e");
    }
  }

  // HTTP POST Handler
  Future<dynamic> post(String endpoint, Map<String, dynamic> body, {bool requireAuth = false}) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    try {
      final response = await http.post(
        url,
        headers: _getHeaders(requireAuth: requireAuth),
        body: jsonEncode(body),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception("Network request failed: $e");
    }
  }

  // Process JSON and throw exceptions for HTTP error states cleanly
  dynamic _processResponse(http.Response response) {
    final decoded = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decoded;
    } else {
      // Pass the API message cleanly out to the UI layer
      throw HttpException(decoded['message'] ?? 'Something went wrong across the server gateway');
    }
  }
}