import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../constant/app_strings.dart';
import '../../../constant/glopal_app.dart';
import '../connection/network.dart';
import '../constant/status_code.dart';
import '../errors/exceptions.dart';
import '../errors/failure.dart';

class Api extends Network {
  @override
  Future<Either<Failure, Map<String, dynamic>>> post(
      String url, Map<String, dynamic> data,
      {bool addToken = true}) async {
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'lang': 'ar',
            'Content-Type': 'application/json',
            //  if(addToken) 'Authorization': 'Bearer ${GlopalApp.userModel!.data.token}'
          },
          body: json.encode(data));
      return Right(json.decode(response.body));
    } catch (e) {
      print(e);
      print('error auth');
      return const Left(ServerFailure(StringsManager.serverFailureMsg));
    }
  }

  @override
  Future<File> getFile(String url, Map<String, dynamic> data) async {
    http.Response? response;
    try {
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'lang': 'ar',
            'Content-Type': 'application/json',
            //  if(addToken) 'Authorization': 'Bearer ${GlopalApp.userModel!.data.token}'
          },
          body: json.encode(data));
      if (response.statusCode == 200) print('yeeeeeeeeeeees');
      return File(response.body);
    } catch (e) {
      print(e);
      print('error auth');
      return json.decode(response!.body);
    }
  }

  @override
  Future<Either<Failure, List<dynamic>>> postList(
      String url, Map<String, dynamic> data) async {
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'lang': 'ar',
            'Content-Type': 'application/json',
          },
          body: json.encode(data));
      return Right(json.decode(response.body));
    } catch (e) {
      return const Left(ServerFailure(StringsManager.serverFailureMsg));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> get(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        'Content-Type': "application/json; charset=utf-8",
        //  'AccessToken': '',
      });
      return Right(json.decode(response.body));
    } catch (e) {
      print(e);
      return const Left(ServerFailure(StringsManager.serverFailureMsg));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> delete(String url) async {
    try {
      http.Response response = await http.delete(Uri.parse(url), headers: {
        'Content-Type': "application/json; charset=utf-8",
        //    'Authorization': 'Bearer ${GlopalApp.userModel!.data.token}'
      });
      return Right(json.decode(response.body));
    } catch (e) {
      print(e);
      return const Left(ServerFailure(StringsManager.serverFailureMsg));
    }
  }

  @override
  Future<Either<Failure, dynamic>> uploadImage(
      String url, Map<String, dynamic> data, bool returnBool) async {
    FormData formData = FormData.fromMap(data);

    Dio dio = Dio();

    dio.options.headers["Content-Type"] = "application/json; charset=utf-8";
    try {
      final response = await dio.post(
        url,
        data: formData,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (response.statusCode == StatusCode.ok) {
        return Right(returnBool ? true : response.data);
      }
    } catch (e) {
      print('errorr  $e');
    }

    return const Left(ServerFailure(StringsManager.serverFailureMsg));
  }
}

Api api = Api();
