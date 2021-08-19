import 'package:dio/dio.dart';

class WhatTheCommitClient {
  WhatTheCommitClient();

  Future<dynamic> fetchMessage() async {
    final response = await Dio().get('http://whatthecommit.com/');

    return response.data;
  }
}
