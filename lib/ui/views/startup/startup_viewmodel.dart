import 'package:chatbot/app/util/fake_auth_guard.dart';
import 'package:stacked/stacked.dart';
import 'package:chatbot/app/app.locator.dart';
import 'package:chatbot/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    fakeAuthGuard();
  }
}
