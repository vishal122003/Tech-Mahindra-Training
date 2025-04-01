import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String _baseUrl = 'https://api.example.com'; // Replace with the actual base URL

  Future<Map<String, dynamic>> fetchCarDetails(String carId) async {
    final response = await http.get(Uri.parse('$_baseUrl/car/$carId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load car details');
    }
  }

  Future<List<dynamic>> fetchLocations() async {
    final response = await http.get(Uri.parse('$_baseUrl/locations'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load locations');
    }
  }
}
