import 'package:chatbot/app/app.router.dart';
import 'package:chatbot/app/repository/authentication_repo.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:chatbot/ui/views/login/login_view.form.dart';
import '../../../app/app.locator.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authRepo = locator<AuthenticationRepo>();
  login() async {
    //usernameValue;
    var result =
        await _authRepo.login(email: usernameValue, password: passwordValue);
    print(result);
  }

  goToCreateAccount() {}

  guestSignIn() => _navigationService.replaceWithHomeView();
}
