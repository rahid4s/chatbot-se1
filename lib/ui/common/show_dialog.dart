import 'package:stacked_services/stacked_services.dart';

import '../../app/app.dialogs.dart';
import '../../app/app.locator.dart';

showApiDialog(String? s) {
  locator<DialogService>().showCustomDialog(
    variant: DialogType.infoAlert,
    title: 'Error',
    description: s?.toString() ?? 'An Error Occurred',
  );
}
