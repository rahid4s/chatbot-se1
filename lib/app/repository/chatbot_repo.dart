import 'package:chatbot/app/util/string_list_helper.dart';
import 'package:chatbot/ui/common/data.dart';

import 'package:dio/dio.dart';

class ChatBotRepo {
  final dio = Dio();

  Future<dynamic> sendMsg({query, uid}) async {
    try {
      final formData = FormData.fromMap({
        'query': query,
        'id': uid,
      });

      var urlEndPoint = 'anonymousMessage';
      if (uid == null || isBlankString(uid)) {
        urlEndPoint = 'sendMessage';
      } else {
        urlEndPoint = 'anonymousMessage';
      }
      Response response =
          await dio.post('${AppData.baseAPI}/v1/$urlEndPoint', data: formData);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return 'An Error Occurred: ${response.statusCode}';
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> getHistory({uid}) async {
    try {
      final formData = FormData.fromMap({
        'id': uid,
      });

      Response response = await dio.post('${AppData.baseAPI}/v1/getChatHistory',
          data: formData);

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
