import 'dart:math';

class ChatTabData {
  String name;
  String image;
  String message;
  int unReadMessage;

  ChatTabData(this.name, this.image, this.message, this.unReadMessage);

  ChatTabData.zero();

  ChatTabData fromMapObject(Map<String, dynamic> map) {
    return ChatTabData(
        map["firstName"], map["picture"], map["email"], Random().nextInt(20));
  }

  List<ChatTabData> getDataFormListData(List responseList) {
    List<ChatTabData> list = [];

    responseList.forEach((element) {
      list.add(fromMapObject(element));
    });

    return list;
  }
}
