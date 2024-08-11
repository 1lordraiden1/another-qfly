// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CourseModel courseModelFromJson(String str) => CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  CourseModel({
    required this.statusCode,
    required this.data,
    required this.message,
  });

  int statusCode;
  CourseData data;
  String message;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    statusCode: json["statusCode"],
    data: CourseData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data.toJson(),
    "message": message,
  };
}

class CourseData {
  CourseData({
    required this.id,
    required this.title,
    required this.desc,
    required this.imageUrl,
    required this.isAvailable,
  });

  int id;
  String title;
  String desc;
  String imageUrl;
  bool isAvailable;

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
    id: json["id"],
    title: json["title"]??'',
    desc: json["desc"]??'',
    imageUrl: json["image_URL"]??'',
    isAvailable: json["isAvailable"]??false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "desc": desc,
    "image_URL": imageUrl,
    "isAvailable": isAvailable,
  };
}
