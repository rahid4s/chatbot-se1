import 'package:chatbot/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  login() {}

  goToCreateAccount() {}

  guestSignIn() => _navigationService.replaceWithHomeView();
}
