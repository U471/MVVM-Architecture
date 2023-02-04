import 'dart:developer';

import 'package:http/http.dart';
import 'package:mvvm_architecture/data/network/BaseApiservices.dart';
import 'package:mvvm_architecture/data/network/NetworkApiService.dart';
import 'package:mvvm_architecture/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      log('log error is$e');
      rethrow;
    }
  }

  Future<dynamic> SignUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.signUpUrl, data);
      return response;
    } catch (e) {
      log('log error is$e');
      rethrow;
    }
  }
}
