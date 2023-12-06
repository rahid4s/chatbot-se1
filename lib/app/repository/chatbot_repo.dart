import 'package:chatbot/app/util/string_list_helper.dart';
import 'package:chatbot/ui/common/data.dart';

import 'package:dio/dio.dart';

import '../../ui/common/show_dialog.dart';

class ChatBotRepo {
  final dio = Dio();

  Future<String> sendMsg({
    required String query,
    int? uid,
    required String link,
    required int llm,
  }) async {
    try {
      final formData = FormData.fromMap({
        'query': query,
        'id': uid,
        'llm': llm,
      });

      var urlEndPoint = 'anonymousMessage';
      if (uid == null) {
        urlEndPoint = 'anonymousMessage';
      } else {
        urlEndPoint = 'sendMessage';
      }
      Response response =
          await dio.post('$link/v1/$urlEndPoint', data: formData);

      if (response.statusCode == 200) {
        String data = response.data['response'];
        return data;
      } else {
        showApiDialog('An Error Occurred: ${response.statusCode}');
        return '';
      }
    } catch (e) {
      showApiDialog('An Error Occurred: $e');
      return '';
    }
  }

  Future<List<dynamic>> getHistory({uid}) async {
    try {
      final formData = FormData.fromMap({
        'id': uid,
      });

      Response response = await dio.post('${AppData.baseAPI}/v1/getChatHistory',
          data: formData);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['response'];
        return data;
      } else {
        showApiDialog('An Error Occurred: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      showApiDialog('An Error Occurred: $e');
      return [];
    }
  }
}
