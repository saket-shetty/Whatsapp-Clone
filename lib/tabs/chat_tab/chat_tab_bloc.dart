import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:whatsapp_clone/tabs/chat_tab/chat_tab_data.dart';
import 'package:whatsapp_clone/tabs/chat_tab/chat_tab_repository.dart';

class ChatTabBloc {
  StreamController chatDataListController =
      BehaviorSubject<List<ChatTabData>>();

  ChatTabRepository _repository = ChatTabRepository();

  ChatTabBloc(){
    getChatData();
  }

  void getChatData() async {
    List<ChatTabData> _list = await _repository.getChatDetails();
    chatDataListController.sink.add(_list);
  }

  dispose() {
    chatDataListController.close();
  }
}
