import 'dart:convert';
import 'package:http/http.dart' as http;

class PlacesApiService {
  final String apiUrl = 'https://yourapi.com/places';

  Future<List<Map<String, dynamic>>> fetchPlaces() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load places');
    }
  }
}
