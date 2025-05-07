import 'dart:io';

import 'package:dio/dio.dart';
import 'package:trust_zone/features/home/data/models/place.dart';

class ProfileApiService {
  final Dio dio;

  ProfileApiService(Object object)
      : dio = Dio(BaseOptions(
          baseUrl: 'https://trustzone.azurewebsites.net', // تحديد base URL
          headers: {
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkb25pYTEyMyIsImp0aSI6IjJmNWI2MjJkLWRjNWQtNDBlZS1hZTUwLWYxMDgzOWNkNmMxNiIsIlVpZCI6IjU3NTBhNWNhLWQ4MDctNGExMC04ZDYwLTc1NDg2NmZjODcyZCIsInJvbGVzIjoiVXNlciIsImV4cCI6MTc0Nzg1Mzc4OCwiaXNzIjoiVHJ1c3Rab25lIiwiYXVkIjoiVHJ1c3Rab25lVXNlciJ9.2VzM558dhp7-ia_o3v2FevStIPg8_8hHybK2kmjDiJk',
            'Content-Type': 'application/json',
          },
        ));

  // GET request
  Future<Response> get(String url, {Map<String, dynamic>? headers}) async {
    return await dio.get(
      url,
      options: Options(headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkb25pYTEyMyIsImp0aSI6IjJmNWI2MjJkLWRjNWQtNDBlZS1hZTUwLWYxMDgzOWNkNmMxNiIsIlVpZCI6IjU3NTBhNWNhLWQ4MDctNGExMC04ZDYwLTc1NDg2NmZjODcyZCIsInJvbGVzIjoiVXNlciIsImV4cCI6MTc0Nzg1Mzc4OCwiaXNzIjoiVHJ1c3Rab25lIiwiYXVkIjoiVHJ1c3Rab25lVXNlciJ9.2VzM558dhp7-ia_o3v2FevStIPg8_8hHybK2kmjDiJk',
        ...?headers,
      }),
    );
  }

  // PUT request
  Future<Response> put(String url, {dynamic data, Map<String, dynamic>? headers}) async {
    return await dio.put(
      url,
      data: data,
      options: Options(headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkb25pYTEyMyIsImp0aSI6IjJmNWI2MjJkLWRjNWQtNDBlZS1hZTUwLWYxMDgzOWNkNmMxNiIsIlVpZCI6IjU3NTBhNWNhLWQ4MDctNGExMC04ZDYwLTc1NDg2NmZjODcyZCIsInJvbGVzIjoiVXNlciIsImV4cCI6MTc0Nzg1Mzc4OCwiaXNzIjoiVHJ1c3Rab25lIiwiYXVkIjoiVHJ1c3Rab25lVXNlciJ9.2VzM558dhp7-ia_o3v2FevStIPg8_8hHybK2kmjDiJk',
        'Content-Type': 'application/json',
        ...?headers,
      }),
    );
  }
Future<String> getSasUrl(String fileName) async {
  final response = await dio.get('/api/UserProfile/upload-image?fileName=$fileName');
  return response.data['sasUrl']; // حسب الريسبونس
}

Future<void> uploadImageToSas(String sasUrl, File imageFile) async {
  await dio.put(
    sasUrl,
    data: imageFile.openRead(),
    options: Options(
      headers: {
        'x-ms-blob-type': 'BlockBlob',
        'Content-Type': 'image/jpeg',
      },
    ),
  );
}


  Future<List<BranchModel>> getBranchesByCategory(int categoryId) async {
    final response = await dio.get(
      'https://trustzone.azurewebsites.net/api/Branch/category/$categoryId',
      options: Options(
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkb25pYTEyMyIsImp0aSI6IjJmNWI2MjJkLWRjNWQtNDBlZS1hZTUwLWYxMDgzOWNkNmMxNiIsIlVpZCI6IjU3NTBhNWNhLWQ4MDctNGExMC04ZDYwLTc1NDg2NmZjODcyZCIsInJvbGVzIjoiVXNlciIsImV4cCI6MTc0Nzg1Mzc4OCwiaXNzIjoiVHJ1c3Rab25lIiwiYXVkIjoiVHJ1c3Rab25lVXNlciJ9.2VzM558dhp7-ia_o3v2FevStIPg8_8hHybK2kmjDiJk',
          'accept': '*/*',
        },
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => BranchModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load branches');
    }
  }


}
