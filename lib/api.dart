import 'dart:convert';
import 'package:http/http.dart' as http;

const kBaseUrl = 'http://192.168.22.70/';

Future<ResponseData> executeAPI(String endpoint,
    [Map<String, String>? params]) async {
  var uri = Uri.parse(kBaseUrl + endpoint);
  if (params != null) {
    uri = uri.replace(queryParameters: params);
  }
  var response = await http.get(uri);
  return ResponseData.fromJson(jsonDecode(response.body));
}

class ResponseData {
  final String status;
  final String? message;
  final dynamic data;

  ResponseData.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = json['data'];
}