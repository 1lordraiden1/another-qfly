import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import '../errors/failure.dart';

abstract class Network{
  Future<Either<Failure,Map<String, dynamic>>> post(String url,Map<String,dynamic>data,{bool addToken=true}) ;
  Future<Either<Failure,List<dynamic>>> postList(String url,Map<String,dynamic>data) ;
  Future<Either<Failure,Map<String, dynamic>>>get(String url);
  Future<Either<Failure,Map<String, dynamic>>>delete(String url);
  Future<File>getFile(String url,Map<String,dynamic>data);
  Future<Either<Failure,dynamic>>uploadImage(String url,Map<String,dynamic>data,bool returnBool);


  }