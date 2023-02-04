import 'dart:developer';

import 'package:mvvm_architecture/model/user_list_model.dart';

import '../data/network/BaseApiservices.dart';
import '../data/network/NetworkApiService.dart';
import '../res/app_url.dart';

class UserRepository {
  BaseApiServices _apiServices = NetworkApiService();
  Future<UserListMode> fetchUserList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.userListUrl);
      return UserListMode.fromJson(response);
    } catch (e) {
      log('log error is$e');
      rethrow;
    }
  }
}
