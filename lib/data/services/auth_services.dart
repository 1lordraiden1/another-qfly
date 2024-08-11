import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:qfly/constant/app_strings.dart';
import 'package:qfly/data/Shared/sharedPreferences.dart';
import 'package:qfly/data/model/responses/flight_response.dart';
import 'package:qfly/data/network/constant/end_points.dart';
import 'package:qfly/data/network/errors/error_message_model.dart';
import 'package:qfly/data/services/api_services.dart';

class AuthService {
  final Dio dio = Dio();
  // Replace with your actual authentication logic (e.g., API calls, Firebase, etc.)
  //final apiService = ApiService(baseUrl: );

  Future<String> authMe() async {
    final url = Uri.parse(EndPoints.baseUrl // + EndPoints.getToken,
        ); // Replace with your API endpoint

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      final decodedData = json.decode(response.body);
      final token = decodedData['data']['token'].toString();

      // --- Storing token in local storage ---

      await SharedPreferencesUtil.setAuthToken("authToken", token);
      print(SharedPreferencesUtil.getAuthToken("authToken"));

      return token;
    } else {
      throw Exception('Failed to load airports data');
    }
  }

  // Simulate a successful login and save the token
  Future<String> getOurAuth() async {
    // Authenticate user and get the access token
    //final response = await api.post(baseUrl+courseUrl);

    /* final url = Uri.parse(
      EndPoints.testURL + EndPoints.testToken,
    ); */

    try {
      /*  final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Basic ZGV2Lm1yZEBxZmx5LmNvOkRldkA3OA==',
        },
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      final decodedData = json.decode(response.body);
      final token = decodedData['accessToken'].toString(); */

      final FlightResponse response = await ApiServices(dio).getToken(
        StringsManager.ourToken,
        StringsManager.contentType,
        StringsManager.contentType,
      );

      final token = response.accessToken!;

      // --- Storing token in local storage ---

      await SharedPreferencesUtil.setAuthToken("accessToken", token);
      print(await SharedPreferencesUtil.getAuthToken("accessToken"));

      return token;
    } catch (e) {
      print(e.toString());
      return '';
    }

    // Save the token to shared preferences
  }

  // Get the current user's access token
  Future<String?> getCurrentUserToken(String authKey) async {
    return SharedPreferencesUtil.getAuthToken(authKey);
  }

  // Clear the user's token (logout)
  Future<void> logout(String authKey) async {
    await SharedPreferencesUtil.clearAuthToken(authKey);
  }

  // Other user-related functions (e.g., fetching user profile, updating info, etc.)
}
