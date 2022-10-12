import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/core/network/http_exceptions.dart';
import 'package:flutter_architecture/core/network/http_respose.dart';
import 'package:http/http.dart' as http;

abstract class HttpClient {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, Map<String, dynamic> body);
  Future<HttpResponse> put(String url, Map<String, dynamic> body);
}

class HttpClientImpl extends HttpClient {
  HttpClientImpl._internal();
  static final HttpClientImpl instance = HttpClientImpl._internal();

  factory HttpClientImpl() => instance;

  HttpResponse _responseHandler(http.Response response) {
    switch (response.statusCode) {
      case 200:
        HttpResponse httpResponse =
            HttpResponse.fromJson(json.decode(response.body.toString()));
        return httpResponse;
      case 400:
        throw BadRequestException(
            statusCode: response.statusCode, message: 'Bad Request');
      case 403:
        throw UnauthorisedException(
            statusCode: response.statusCode, message: 'Unauthorized');
      case 500:
      default:
        throw FetchDataException(
            statusCode: response.statusCode, message: 'Something Went Wrong');
    }
  }

  @override
  Future<HttpResponse> get(String url) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> post(String url, Map<String, dynamic> body) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> put(String url, Map<String, dynamic> body) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
