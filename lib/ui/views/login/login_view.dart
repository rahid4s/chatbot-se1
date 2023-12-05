import 'package:chatbot/ui/common/button_ui.dart';
import 'package:chatbot/ui/common/ui_helpers.dart';
import 'package:chatbot/ui/views/login/login_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/color.dart';
import '../../common/data.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'username'),
  FormTextField(name: 'password'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
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
                text: 'Login',
                textColor: Colors.white,
                onPressed: viewModel.login,
                disabled: viewModel.isBusy,
              ),
              verticalSpaceSmall,
              ButtonUi.only(
                text: 'New User? Signup',
                textColor: AppColor.caption,
                onPressed: viewModel.goToCreateAccount,
                disabled: viewModel.isBusy,
              ),
              ButtonUi.only(
                text: 'Signin As GUEST',
                onPressed: viewModel.guestSignIn,
                disabled: viewModel.isBusy,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
