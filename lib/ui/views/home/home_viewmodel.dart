import 'package:chatbot/app/app.bottomsheets.dart';
import 'package:chatbot/app/app.dialogs.dart';
import 'package:chatbot/app/app.locator.dart';
import 'package:chatbot/app/app.router.dart';
import 'package:chatbot/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../model/chat_model.dart';

class HomeViewModel extends FormViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

// rebuildUi();

  get chatHistory => dummyHistory;

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  setNewBaseLink() {}

  resetBaseLink() {}

  exportHistory() {}

  void logout() {
    _navigationService.replaceWithStartupView();
  }

  void sendQuery() {}
}
