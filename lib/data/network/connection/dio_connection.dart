import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioUtils {
  static Dio? dio;
  static Options? authOptions;
  static CacheOptions cacheOptions =
  CacheOptions(store: MemCacheStore(), policy: CachePolicy.noCache);

  static const String REQUEST_GET = "get";
  static const String REQUEST_POST = "post";
  static const String REQUEST_PUT = "put";
  static const String REQUEST_DELETE = "delete";

  static bool isUnAuthorizedDialogShown = false;
  static const int CONNECTION_TIME_OUT = 60000;

  static void initDio({bool reset = false}) {
    if (dio == null || reset) {
      dio = Dio(BaseOptions(connectTimeout: Duration(milliseconds: CONNECTION_TIME_OUT)));
      dio!.interceptors.add(DioCacheInterceptor(options: cacheOptions));
      dio!.interceptors.add(HttpFormatter());
      dio!.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: false,
          ));
      dio!.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        return handler.next(options);
      }, onResponse:
          (Response response, ResponseInterceptorHandler handler) async {
        return handler.next(response);
      }, onError: (DioError e, ErrorInterceptorHandler handler) async {
        // return handler.next(e);
        var url = "${e.response?.realUri.path ?? "ERROR.URL.EMPTY"}";


          return handler.next(e);
        }
      ));
    }
    authOptions = Options(headers: {

    });
  }



  static Dio? instance() {
    initDio();
    return dio;
  }

  static Future<Response?> request(
      String requestType,
      String url, {
        String? contentType,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
        dynamic body,
        Options? requestOption,
        bool isToCache = true,
        bool forceRefresh = true,
        int daysToCache = 30,
        int hoursToCache = 0,
      }) async {
    initDio();


    authOptions!.headers!["xOsVersion"] = Platform.operatingSystemVersion;
    authOptions!.headers!["xPlatform"] = Platform.operatingSystem;

    if (headers != null && headers.isNotEmpty) {
      headers.keys.forEach((key) {
        authOptions!.headers![key] = headers[key];
      });
    }

    if (contentType != null)
      authOptions!.headers![Headers.contentTypeHeader] = contentType;


    var options = isToCache
        ? cacheOptions
        .copyWith(
        policy: forceRefresh
            ? CachePolicy.refreshForceCache
            : CachePolicy.forceCache,
        maxStale: Nullable<Duration>(Duration(days: daysToCache, hours: hoursToCache)))
        .toOptions()
        : authOptions;

    if (isToCache) {
      if (options!.headers == null) options.headers = {};
      options.headers!.addAll(authOptions!.headers!);
    }

    Response? response;

    try {
      switch (requestType) {
        case REQUEST_GET:
          response = await dio!.get(
            url,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case REQUEST_POST:
          response = await dio!.post(
            url,
            options: requestOption ?? options,
            queryParameters: queryParameters,
            data: body,
            onSendProgress: (int sent, int total) =>
               print("$url : sent : $sent/$total"),
            onReceiveProgress: (recieved, total) =>
                print("$url : recieved : $recieved/$total"),
          );
          break;
        case REQUEST_PUT:
          response = await dio!.put(
            url,
            options: options,
            queryParameters: queryParameters,
            data: body,
            onSendProgress: (int sent, int total) =>
                print("$url : sent : $sent/$total"),
            onReceiveProgress: (recieved, total) =>
                print("$url : recieved : $recieved/$total"),
          );
          break;
        case REQUEST_DELETE:
          response = await dio!.delete(
            url,
            options: options,
            queryParameters: queryParameters,
            data: body,
          );
          break;
      }
    } catch (e) {
      var error = e as DioError;

    }

    return response;
  }

  static bool isRetryDialogShown = false;




  static clearCache() {
    dio?.interceptors.clear();
  }
}

extension _AsOptions on RequestOptions {
  Options asOptions() {
    return Options(
      method: method,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      extra: extra,
      headers: headers,
      responseType: responseType,
      contentType: contentType,
      validateStatus: validateStatus,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
      requestEncoder: requestEncoder,
      responseDecoder: responseDecoder,
      listFormat: listFormat,
    );
  }
}
