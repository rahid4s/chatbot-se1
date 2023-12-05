import 'package:stacked_services/stacked_services.dart';

import '../../services/authentication_service.dart';
import '../app.locator.dart';
import '../app.router.dart';

void fakeAuthGuard() {
  if (locator<AuthenticationService>().userLoggedIn()) {
    locator<NavigationService>().replaceWithHomeView();
  } else {
    locator<NavigationService>().replaceWithLoginView();
  }
}
