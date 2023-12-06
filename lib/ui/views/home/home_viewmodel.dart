import 'dart:io';
import 'dart:typed_data';

import 'dart:html' as html;
import 'package:chatbot/app/app.bottomsheets.dart';
import 'package:chatbot/app/app.dialogs.dart';
import 'package:chatbot/app/app.locator.dart';
import 'package:chatbot/app/app.router.dart';
import 'package:chatbot/app/repository/chatbot_repo.dart';
import 'package:chatbot/app/util/fake_auth_guard.dart';
import 'package:chatbot/app/util/string_list_helper.dart';
import 'package:chatbot/ui/common/app_strings.dart';
import 'package:chatbot/ui/common/data.dart';
import 'package:chatbot/ui/views/home/home_view.form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

import '../../../model/chat_model.dart';
import '../../../services/authentication_service.dart';

class HomeViewModel extends FormViewModel {
  final _dialogService = locator<DialogService>();
  final _authService = locator<AuthenticationService>();
  final _chatbotRepo = locator<ChatBotRepo>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  String selectedLLM = 'LLM1';

  int _llm = 1;

  String _severLink = AppData.baseAPI;
  String get severLink => _severLink;

  bool get showExport => _authService.userIsLoggedIn();

  List<ChatModel> _chatHistory = [];

  //List<ChatModel> get chatHistoryLocal => dummyHistory; // local test dummy
  List<ChatModel> get chatHistory => _chatHistory.reversed.toList();

  runStartupLogic() {
    serverLinkValue = AppData.baseAPI;
    if (!_authService.isGuestMode) getHistory();
  }

  Future getHistory() async {
    List<dynamic> result = await _chatbotRepo.getHistory(uid: _authService.uid);

    if (result.isNotEmpty) {
      _chatHistory = [];
      for (var element in result) {
        Map<String, dynamic> historyItem = element;
        ChatModel chat = ChatModel(
          query: historyItem['query'],
          response: historyItem['answer'],
          userId: historyItem['userId'],
          id: historyItem['id'],
          timestamp: DateTime.parse(historyItem['created_at']),
        );
        _chatHistory.add(chat);
      }

      rebuildUi();
    }
  }

  /* void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked stars on Github',
    );
  } */

  /* void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  } */

  serverSelect() {
    if (!isBlankString(serverLinkValue)) {
      _severLink = serverLinkValue!;
      rebuildUi();
    }
  }

  resetServer() {
    _severLink = AppData.baseAPI;
    serverLinkValue = _severLink;
    rebuildUi();
  }

  export() async {
    await generatePDF(chatHistory);
  }

  Future generatePDF(List<ChatModel> chats) async {
    final pdf = pw.Document();

    //final font = await GoogleFonts.getFont('Noto Sans');
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: chats.map((ChatModel chat) {
          return pw.Text(
            'Q: ${chat.query} \n A: ${chat.response} \n (${chat.timestamp?.toLocal()}) \n\n',
            style: pw.TextStyle(
              fontSize: 12,
              font: font,
            ),
          );
        }).toList(),
      ),
    ));

    final bytes = await pdf.save();
    await Printing.sharePdf(
      bytes: bytes,
      filename: 'history-${DateTime.now().microsecondsSinceEpoch}.pdf',
    );
  }

  void logout() {
    _authService.emptyCred();
    fakeAuthGuard();
  }

  sendChat() async {
    if (!isBlankString(queryValue)) {
      String result = await _chatbotRepo.sendMsg(
        query: queryValue!.trim(),
        uid: _authService.uid,
        link: _severLink,
        llm: _llm,
      );

      if (!isBlankString(result)) {
        ChatModel chat = ChatModel(
          query: queryValue!,
          response: result,
        );
        _chatHistory.add(chat);
        queryValue = '';
        rebuildUi();
      }
    }
  }

  changeLLM(String? newValue) {
    selectedLLM = newValue ?? 'LLM1';

    if (newValue == 'LLM1') {
      _llm = 1;
    } else if (newValue == 'LLM2') {
      _llm = 2;
    } else {
      _llm = 1;
    }
    rebuildUi();
  }
}
