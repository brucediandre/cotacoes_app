import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = 'https://open.er-api.com/v6/latest/USD';

  static Future<Map<String, dynamic>> fetchRates() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Map<String, dynamic>.from(data['rates']);
    } else {
      throw Exception('Erro ao carregar cotações');
    }
  }
}
