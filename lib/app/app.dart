import 'package:chatbot/app/repository/authentication_repo.dart';
import 'package:chatbot/app/repository/chatbot_repo.dart';
import 'package:chatbot/services/authentication_service.dart';
import 'package:chatbot/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:chatbot/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:chatbot/ui/views/home/home_view.dart';
import 'package:chatbot/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:chatbot/ui/views/login/login_view.dart';
import 'package:chatbot/ui/views/signin/signin_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView, path: '/'),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SigninView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    Singleton(classType: AuthenticationService),
    LazySingleton(classType: AuthenticationRepo),
    LazySingleton(classType: ChatBotRepo),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
