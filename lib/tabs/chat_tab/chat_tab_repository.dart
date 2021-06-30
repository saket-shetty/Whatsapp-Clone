import 'dart:convert';

import 'package:whatsapp_clone/network_handler/network_handler.dart';
import 'package:whatsapp_clone/tabs/chat_tab/chat_tab_data.dart';
import 'package:http/http.dart' as http;

class ChatTabRepository {
  ChatTabData _chatTabData = ChatTabData.zero();

  Future<List<ChatTabData>> getChatDetails() async {
    String url = "https://dummyapi.io/data/api/user";
    List<ChatTabData> _list = [];
    http.Response response = await NetworkHandler.getRequest(url);
    if (response.statusCode == 200) {
      final rawData = json.decode(response.body);
      _list = _chatTabData.getDataFormListData(rawData["data"]);
    }
    return _list;
  }
}
