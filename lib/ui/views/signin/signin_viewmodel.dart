import 'package:chatbot/app/app.router.dart';
import 'package:chatbot/ui/views/signin/signin_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/repository/authentication_repo.dart';
import '../../../app/util/fake_auth_guard.dart';
import '../../../services/authentication_service.dart';

class SigninViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _authRepo = locator<AuthenticationRepo>();

  goToLogin() {
    _navigationService.replaceWithLoginView();
  }

  signup() async {
    Map<String, dynamic> result =
        await _authRepo.register(email: usernameValue, password: passwordValue);

    if (result.isNotEmpty) {
      int uid = result['id'];
      String email = result['email'].toString();

      _authService.setCred(uid: uid, email: email);
      fakeAuthGuard();
    }
  }
}
