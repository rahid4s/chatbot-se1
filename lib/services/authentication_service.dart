import 'package:chatbot/app/util/string_list_helper.dart';

class AuthenticationService {
  int? _uid;
  String? _email;
  bool _isGuestMode = false;

  int? get uid => _uid;
  String? get email => _email;
  bool get isGuestMode => _isGuestMode;

  bool userIsLoggedIn() => _uid != null;

  void setCred({required int uid, required String email}) {
    _uid = uid;
    _email = email;
    _isGuestMode = false;
  }

  void emptyCred() {
    _uid = null;
    _email = null;
    _isGuestMode = false;
  }

  void setAsGuestMode() {
    _uid = null;
    _email = null;
    _isGuestMode = true;
  }
}
