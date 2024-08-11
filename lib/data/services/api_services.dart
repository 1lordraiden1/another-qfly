import 'package:dio/dio.dart';
import 'package:qfly/data/model/hotel/hotel_model.dart';
import 'package:qfly/data/model/responses/api_response.dart';
import 'package:qfly/data/model/responses/flight_response.dart';
import 'package:qfly/data/network/constant/end_points.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio) = _ApiServices;

  /* @GET(EndPoints)
  Future<ApiResponse> getHotels(
    @Queries() Map<String, dynamic> queries,
    @Header("guest") String guest,
  ); */

  @GET(EndPoints.testToken)
  Future<FlightResponse> getToken(
    @Header('Authorization') String auth,
    @Header('Accept') String accept,
    @Header('Content') String contentType,
  );

  // Base URL for your API
  /*  static const String baseUrl =
      'https://api2-test.multireisen.com/'; // EndPoints.baseUrl;

  // GET request using Dio
  Future<Response> getDioRequest(String endpoint, String? accessToken) async {
    final response = await _dio.get(
    
      '$baseUrl$endpoint',
      queryParameters: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'Basic ZGV2Lm1yZEBxZmx5LmNvOkRldkA3OA==', //StringsManager.ourToken,
        if (accessToken != null) 'AccessToken': accessToken,
      },
    ); // Get here access token+
    return response;
  }

  Future<void> postData(String url, Map<String, dynamic> data) async {
    // Replace with your API endpoint

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',

        //'Authorization': StringsManager.ourToken,
      }, // Set your desired headers
      body: json.encode(data), // Replace with your request body
    );

    if (response.statusCode == 200) {
      print('Request successful! Response: ${response.body}');
    } else {
      print('Request failed with status code ${response.statusCode}');
    }
  }

  // GET request using http

  Future<http.Response?> getHttpRequest(
      String endpoint, String? userToken, String? searchValue) async {
    print("$baseUrl$endpoint");
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint${{if (searchValue != null) searchValue}}'),
        headers: <String, String>{
          //'Authorization': 'Bearer ${StringsManager.ourToken}',//StringsManager.ourToken,
          if (userToken != null) 'AccessToken': userToken,
        },
      );

      if (response.statusCode == 200) {
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        return response;
      } else {
        debugPrint('Error Response Body: ${response.body}');
        print('Error Status Code: ${response.statusCode}');
        return response;
      }
    } catch (e) {
      print('Exception occurred: $e');
      return null;
    }
  }

  /* Future<http.Response> getHttpRequest(
      String endpoint, String? userToken) async {
        print("$baseUrl$endpoint");
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: <String, String>{
        //'Content-Type': 'application/json',
        'Authorization': StringsManager.ourToken,
        if (userToken != null) 'AccessToken': userToken,
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode.toString());

      return response;
    } else {
      debugPrint(response.body);
      print(response.statusCode.toString());
      return response;
    }
  }
 */
  // POST request using Dio
  Future<Response> postDioRequest(String endpoint, dynamic data) async {
    final response = await _dio.post('$baseUrl$endpoint', data: data);
    return response;
  }

  // DELETE request using http
  Future<http.Response> deleteHttpRequest(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl$endpoint'));
    return response;
  } */
}
