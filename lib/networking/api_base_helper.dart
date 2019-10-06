import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'app_exceptions.dart';

class ApiBaseHelper {
  static const _baseUrl = 'https://api.themoviedb.org/3';

  Future<dynamic> get(String url) async {
    print('Api Get, url $_baseUrl$url');
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _handleResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    print('Api Post, url $url');
    var responseJson;
    try {
      final response = await http.post(_baseUrl + url, body: body);
      responseJson = _handleResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(_baseUrl + url, body: body);
      responseJson = _handleResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(_baseUrl + url);
      apiResponse = _handleResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }
}

dynamic _handleResponse(http.Response response) {
  switch (response.statusCode) {
    case HttpStatus.ok:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case HttpStatus.badRequest:
      throw BadRequestException(response.body.toString());
    case HttpStatus.unauthorized:
    case HttpStatus.forbidden:
      throw UnauthorisedException(response.body.toString());
    case HttpStatus.internalServerError:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
