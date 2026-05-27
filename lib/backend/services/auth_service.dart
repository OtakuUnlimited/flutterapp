// lib/services/auth_service.dart
import 'api_client.dart';

class AuthService {
  final ApiClient _client = ApiClient();

  Future<dynamic> login(String email, String password) async {
    final data = await _client.post('userlogin', {'email': email, 'password': password});
    if (data['success'] == true && data['data'] != null) {
      // Cache the secure Sanctum token inside our ApiClient state context
      ApiClient.setToken(data['data']['token']);
    }
    return data;
  }

  Future<dynamic> register({
    required String username,
    required String email,
    required String password,
    required String userType,
  }) async {
    return await _client.post('userregister', {
      'username': username,
      'email': email,
      'password': password,
      'user_type': userType,
    });
  }

  Future<dynamic> verifyOtp(String email, String otp) async {
    return await _client.post('verify-otp', {'email': email, 'otp': otp});
  }

  Future<dynamic> storeBasicDetails(Map<String, dynamic> details) async {
    return await _client.post('store_basic_details', details);
  }
}