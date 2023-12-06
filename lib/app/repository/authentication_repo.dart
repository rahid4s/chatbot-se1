import 'dart:convert';

import 'package:chatbot/ui/common/data.dart';
import 'package:dio/dio.dart';

import '../../ui/common/show_dialog.dart';
/* import 'package:http/http.dart' as http; */

class AuthenticationRepo {
  final dio = Dio();

  Future<Map<String, dynamic>> login({email, password}) async {
    try {
      final formData = FormData.fromMap({
        'email': email,
        'password': password,
      });
      Response response =
          await dio.post('${AppData.baseAPI}/v1/login-user', data: formData);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data['data'];
        return data;
      } else {
        showApiDialog('An Error Occurred: ${response.statusCode}');
        return {};
      }
    } catch (e) {
      showApiDialog('An Error Occurred: $e');
      return {};
    }
  }

  Future<dynamic> register({email, password}) async {
    try {
      final formData = FormData.fromMap({
        'email': email,
        'password': password,
        'name': email,
      });
      Response response =
          await dio.post('${AppData.baseAPI}/v1/sign-user', data: formData);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data['data'];
        return data;
      } else {
        showApiDialog('An Error Occurred: ${response.statusCode}');
        return {};
      }
    } catch (e) {
      showApiDialog('An Error Occurred: $e');
      return {};
    }
  }
}
