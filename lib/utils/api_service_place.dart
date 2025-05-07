// import 'dart:convert';

// class ApiService {
//   final String apiUrl = 'https://yourapi.com/places';

//   Future<List<Map<String, dynamic>>> fetchPlaces() async {
//     // هنا المفروض يكون عندك الكود اللي بيعمل الـHTTP Request
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load places');
//     }
//   }
// }
