import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common_widgets/common_widgets.dart';
import 'package:whatsapp_clone/tabs/chat_tab/chat_tab_bloc.dart';
import 'package:whatsapp_clone/tabs/chat_tab/chat_tab_data.dart';

class CallTabScreen extends StatefulWidget {
  const CallTabScreen({Key key}) : super(key: key);

  @override
  _CallTabScreenState createState() => _CallTabScreenState();
}

class _CallTabScreenState extends State<CallTabScreen>
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
              // itemCount: Random().nextInt(3)+1,
              itemCount: 4,
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
                      subtitle: Text(
                          "Today, ${Random().nextInt(12).toString()}:${Random().nextInt(59)} ${Random().nextBool() ? "AM" : "PM"}"),
                      trailing: Icon(Icons.call,
                          color: Random().nextBool()
                              ? Color(0xff075E54)
                              : Colors.red),
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
            );
          } else {
            return Container();
          }
        });
  }

  @override
  bool get wantKeepAlive => true;
}
