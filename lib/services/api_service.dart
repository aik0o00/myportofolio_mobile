
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Untuk Flutter Web / Chrome di komputer yang sama dengan Django.
  static const String baseUrl = 'http://127.0.0.1:8000/api/v1';

  // Token disimpan selama aplikasi berjalan.
  static String? token;

  static Map<String, String> get headers => {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Token $token',
      };

  // LOGIN
  static Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/token/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      token = data['token'];
      return true;
    }

    return false;
  }

  // GET SKILLS
  static Future<List<dynamic>> getSkills() async {
    final response = await http.get(
      Uri.parse('$baseUrl/skills/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception('Gagal mengambil data Skills: ${response.statusCode}');
  }

  // ADD SKILL
  static Future<bool> addSkill({
    required String name,
    required String category,
    required String level,
    required String description,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/skills/'),
      headers: headers,
      body: jsonEncode({
        'name': name,
        'category': category,
        'level': level,
        'description': description,
      }),
    );

    return response.statusCode == 201;
  }

  // STAR SKILL
  static Future<bool> toggleStar(String skillId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/skills/$skillId/star/'),
      headers: headers,
    );

    return response.statusCode == 200;
  }

  // LOGOUT
  static Future<void> logout() async {
    if (token != null) {
      await http.post(
        Uri.parse('$baseUrl/auth/logout/'),
        headers: headers,
      );
    }

    token = null;
  }
}
