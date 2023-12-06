import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/button_ui.dart';
import '../../common/color.dart';
import '../../common/data.dart';
import '../../common/ui_helpers.dart';
import 'signin_view.form.dart';
import 'signin_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'username'),
  FormTextField(name: 'password'),
])
class SigninView extends StackedView<SigninViewModel> with $SigninView {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SigninViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '${AppData.appName}.',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                    color: AppColor.accent),
              ),
              TextFormField(
                enabled: !viewModel.isBusy,
                decoration: const InputDecoration(labelText: 'Username'),
                controller: usernameController,
                focusNode: usernameFocusNode,
              ),
              verticalSpaceSmall,
              TextFormField(
                enabled: !viewModel.isBusy,
                decoration: const InputDecoration(labelText: 'Password'),
                controller: passwordController,
                focusNode: passwordFocusNode,
              ),
              verticalSpaceMedium,
              ButtonUi(
                text: 'Register',
                textColor: Colors.white,
                onPressed: viewModel.signup,
                disabled: viewModel.isBusy,
              ),
              verticalSpaceSmall,
              ButtonUi.only(
                text: 'Already A User? Login',
                textColor: AppColor.caption,
                onPressed: viewModel.goToLogin,
                disabled: viewModel.isBusy,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SigninViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SigninViewModel();

  @override
  void onViewModelReady(SigninViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(SigninViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
