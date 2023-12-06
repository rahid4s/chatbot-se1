import 'dart:convert';

import 'package:chatbot/app/app.router.dart';
import 'package:chatbot/app/repository/authentication_repo.dart';
import 'package:chatbot/app/util/fake_auth_guard.dart';
import 'package:chatbot/services/authentication_service.dart';
import 'package:chatbot/ui/common/show_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:chatbot/ui/views/login/login_view.form.dart';
import '../../../app/app.locator.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _authRepo = locator<AuthenticationRepo>();

  signin() async {
    Map<String, dynamic> result =
        await _authRepo.login(email: usernameValue, password: passwordValue);

    if (result.isNotEmpty) {
      int uid = result['id'];
      String email = result['email'].toString();

      _authService.setCred(uid: uid, email: email);
      fakeAuthGuard();
    }
  }

  goToCreateAccount() {
    _navigationService.replaceWithSigninView();
  }

  guestSignIn() => _navigationService.replaceWithHomeView();
}
