import 'dart:convert';

import 'package:http/http.dart' as http;

// to call todo api

class TodoService {
  // to call delte api
  static Future<bool> deleteById(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    return response.statusCode == 200;
  }
  // to add the data and call get api

  static Future<List?> fetchTodos() async {
    // final url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
    final uri = Uri.parse('https://api.nstack.in/v1/todos?page=1&limit=20');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      return result;
    } else {
      return null;
    }
  }
}
