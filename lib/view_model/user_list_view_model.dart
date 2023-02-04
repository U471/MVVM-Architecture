import 'package:flutter/cupertino.dart';
import 'package:mvvm_architecture/data/response/api_response.dart';
import 'package:mvvm_architecture/model/user_list_model.dart';

import '../respository/user_repository.dart';

class UserListViewModel with ChangeNotifier {
  final _myrepo = UserRepository();
  ApiResponse<UserListMode> userList = ApiResponse.loading();
  setUserList(ApiResponse<UserListMode> response) {
    userList = response;
    notifyListeners();
  }

  Future<void> fetchUserList() async {
    setUserList(ApiResponse.loading());
    _myrepo.fetchUserList().then((value) {
      print("data is ${value.data}");
      setUserList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setUserList(ApiResponse.error(error.toString()));
    });
  }
}
