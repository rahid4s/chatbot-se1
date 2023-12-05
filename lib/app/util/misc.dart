import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'string_list_helper.dart';

Future goToUrl({
  required String? link,
  bool httpsFallback = false,
}) async {
  try {
    if (!isBlankString(link)) {
      if (link!.startsWith('www')) {
        link = httpsFallback ? 'https://$link' : 'http://$link';
      }
    }
    await launchUrl(Uri.parse(link ?? ''));
  } catch (e) {
    debugPrint(e.toString());
  }
}

/// change focus to next form field
changeFocusTo(
    {required BuildContext context,
    required FocusNode currentFocus,
    FocusNode? nextFocus}) {
  if (nextFocus == null) {
    hideKeyboard();
  } else {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

/// dismiss keyboard
hideKeyboard() {
  FocusManager.instance.primaryFocus!.unfocus();
}
