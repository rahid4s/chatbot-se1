import 'package:chatbot/ui/common/button_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:chatbot/ui/common/app_colors.dart';
import 'package:chatbot/ui/common/ui_helpers.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/color.dart';
import '../../common/data.dart';
import 'home_view.form.dart';
import 'home_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'serverLink'),
  FormTextField(name: 'query'),
])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 25),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '${AppData.appName}.',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: AppColor.accent),
                  ),
                  DropdownButton(
                    value: viewModel.selectedLLM,
                    icon: const Icon(Icons.arrow_drop_down),
                    items: ['LLM1', 'LLM2'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) =>
                        viewModel.changeLLM(newValue),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    // width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      controller: serverLinkController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Custom Server Link'),
                    ),
                  ),
                  horizontalSpaceTiny,
                  ButtonUi(
                    onPressed: viewModel.serverSelect,
                    text: 'SET',
                    textColor: Colors.white,
                  ),
                  horizontalSpaceTiny,
                  ButtonUi(
                    onPressed: viewModel.resetServer,
                    text: 'RESET',
                    textColor: Colors.white,
                  ),
                  horizontalSpaceTiny,
                  if (viewModel.showExport) ...[
                    ButtonUi(
                      onPressed: viewModel.export,
                      text: 'EXPORT',
                      textColor: Colors.white,
                    ),
                    horizontalSpaceTiny,
                  ],
                  DropdownButton(
                    value: 'Account',
                    icon: const Icon(Icons.arrow_drop_down),
                    items: ['Account', 'Logout'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue == 'Logout') {
                        viewModel.logout();
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: viewModel.chatHistory.length,
                itemBuilder: (context, index) {
                  // return Text(state.chatHistory[index].question);
                  return Padding(
                    padding: const EdgeInsets.all(smallSize),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Text('You '),
                          title: Text(viewModel.chatHistory[index].query),
                        ),
                        ListTile(
                          leading: const Text('ChatBOT '),
                          title: Text(viewModel.chatHistory[index].response),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: queryController,
                      focusNode: queryFocusNode,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your query',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: viewModel.sendChat,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
            verticalSpaceSmall,
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
  }

  @override
  void onDispose(HomeViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
