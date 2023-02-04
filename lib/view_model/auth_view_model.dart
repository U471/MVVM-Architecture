import 'dart:developer';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture/respository/auth_repository.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //---------- Login -----------
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myrepo.loginApi(data).then((value) {
      print("token =${value.toString()}");

      setLoading(false);

      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(token: value['token'].toString()));

      Utils.FlushbarError(context, "Successfully logged in");
      Navigator.pushNamed(context, RoutesName.home);

      if (kDebugMode) {
        print(value.toString());
      }
    }).catchError((error) {
      setLoading(false);
      Utils.FlushbarError(context, error.toString());
      if (kDebugMode) {
        print('error is === ${error.toString()}');
      }
    });
  }

  //------------ Sign Up - -----

  Future<void> SignUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myrepo.SignUpApi(data).then((value) {
      setLoading(false);
      Utils.FlushbarError(context, "Successfully SignUp");
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).catchError((error) {
      setLoading(false);
      Utils.FlushbarError(context, error.toString());
      if (kDebugMode) {
        print('error is === ${error.toString()}');
      }
    });
  }
}
