import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common_widgets/common_widgets.dart';
import 'package:whatsapp_clone/tabs/chat_tab/chat_tab_bloc.dart';
import 'package:whatsapp_clone/tabs/chat_tab/chat_tab_data.dart';

class ChatTabScreen extends StatefulWidget {
  const ChatTabScreen({Key key}) : super(key: key);

  @override
  _ChatTabScreenState createState() => _ChatTabScreenState();
}

class _ChatTabScreenState extends State<ChatTabScreen>
    with AutomaticKeepAliveClientMixin {
  ChatTabBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ChatTabBloc();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatTabData>>(
      stream: _bloc.chatDataListController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.length > 0) {
          List<ChatTabData> list = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              ChatTabData _data = list[index];
              return Column(
                children: [
                  ListTile(
                    leading: profileImageWidget(_data.image, radius: 30),
                    title: Text(
                      _data.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(_data.message),
                    trailing: _data.unReadMessage > 0
                        ? CircleAvatar(
                            maxRadius: 13,
                            child: Text(_data.unReadMessage.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                            backgroundColor: Colors.green)
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                    child: Divider(
                      height: 3,
                    ),
                  ),
                ],
              );
            },
            itemCount: list.length,
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
