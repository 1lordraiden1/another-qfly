import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qfly/data/model/room/room_models/child_model.dart';

class RoomData {
  final int id;
  int adults;
  int children;
  List<Child> childs;

  RoomData({
    required this.id,
    required this.adults,
    required this.children,
    required this.childs,
  });

  factory RoomData.empty() {
    return RoomData(
      id: 0,
      adults: 1,
      children: 0,
      childs: [],
    );
  }

  factory RoomData.emptyWithId(int id) {
    return RoomData(
      id: id,
      adults: 1,
      children: 0,
      childs: [],
    );
  }

  static List<int> getAllChildrenAgesInt(List<RoomData> rooms) {
    List<int> ages = [];
    for (var room in rooms) {
      for (var child in room.childs) {
        ages.add(child.age);
      }
    }
    return ages;
  }

  static String getAdultForEachRoom(List<RoomData> rooms) {
    String ads = '';
    for (var room in rooms) {
      ads += '${room.adults},';
    }
    return ads.substring(0, ads.lastIndexOf(","));
  }

  static String getChildrenForEachRoom(List<RoomData> rooms) {
    String clds = '';
    for (var room in rooms) {
      clds += '${room.children},';
    }
    return clds.substring(0, clds.lastIndexOf(","));
  }

  static String getAllChildrenAges(List<RoomData> rooms) {
    List<String> ages = [];
    for (int i = 0; i < rooms.length; i++) {
      for (var c in rooms[i].childs) {
        ages.add('${c.age}');
      }
    }

    print(ages.join(","));

    return jsonEncode(ages.join(","));

    //ages.substring(0, ages.lastIndexOf(","))
  }
}
