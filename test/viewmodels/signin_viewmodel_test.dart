import 'package:flutter_test/flutter_test.dart';
import 'package:chatbot/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SigninViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
