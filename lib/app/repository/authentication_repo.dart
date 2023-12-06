import 'package:chatbot/ui/common/data.dart';
import 'package:dio/dio.dart';
/* import 'package:http/http.dart' as http; */

class AuthenticationRepo {
  final dio = Dio();

  Future<dynamic> login({email, password}) async {
    try {
      final formData = FormData.fromMap({
        'email': email,
        'password': password,
      });
      Response response =
          await dio.post('${AppData.baseAPI}/v1/login-user', data: formData);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return 'An Error Occurred: ${response.statusCode}';
      }
    } catch (e) {
      return e;
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
        return response.data;
      } else {
        return 'An Error Occurred: ${response.statusCode}';
      }
    } catch (e) {
      return e;
    }
  }
}
