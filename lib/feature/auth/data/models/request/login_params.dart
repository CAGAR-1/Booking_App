import 'package:dio/dio.dart';

class LoginParams {
  dynamic? email;
  dynamic? password;

  LoginParams({this.email, this.password});

  // Map<String, dynamic> toJson() {
  //   var formData = <String, dynamic>{};
  //   formData = {
  //     'email': email,
  //     'password': password,
  //   };
  //   return formData;
  // }
  FormData toFormData() {
    final formData = FormData();
    formData.fields
      ..add(MapEntry('email', email))
      ..add(MapEntry('password', password));

    return formData;
  }
}
