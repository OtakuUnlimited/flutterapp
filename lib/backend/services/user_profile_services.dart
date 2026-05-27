// lib/services/user_profile_service.dart
import 'api_client.dart';

class UserProfileService {
  final ApiClient _client = ApiClient();

  // Calls Route::get('user/get-profile') securely
  Future<dynamic> getLoggedInUserProfile() async {
    return await _client.get('user/get-profile', requireAuth: true);
  }

  // Calls Route::post('add_new_guruservice') securely
  Future<dynamic> addNewGuruService(Map<String, dynamic> serviceData) async {
    return await _client.post('add_new_guruservice', serviceData, requireAuth: true);
  }

  // Calls Route::post('updateavailability') securely
  Future<dynamic> updateAvailability(List<Map<String, dynamic>> schedules) async {
    return await _client.post('updateavailability', {'availability': schedules}, requireAuth: true);
  }
}