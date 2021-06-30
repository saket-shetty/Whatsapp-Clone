import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common_widgets/common_widgets.dart';
import 'package:whatsapp_clone/tabs/chat_tab/chat_tab_bloc.dart';
import 'package:whatsapp_clone/tabs/chat_tab/chat_tab_data.dart';

class StatustabScreen extends StatefulWidget {
  const StatustabScreen({Key key}) : super(key: key);

  @override
  _StatustabScreenState createState() => _StatustabScreenState();
}

class _StatustabScreenState extends State<StatustabScreen>
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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: profileImageWidget(
              "https://randomuser.me/api/portraits/med/men/43.jpg",
              radius: 30,
            ),
            title: Text(
              "My Status",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 10),
            child: Text(
              "Viewed updates",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<ChatTabData>>(
                stream: _bloc.chatDataListController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data.length > 0) {
                    List<ChatTabData> list = snapshot.data;
                    return ListView.builder(
                      // itemCount: Random().nextInt(5) + 1,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        ChatTabData _data = list[index];
                        return Column(
                          children: [
                            ListTile(
                                leading:
                                    profileImageWidget(_data.image, radius: 30),
                                title: Text(
                                  _data.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                    "Today, ${Random().nextInt(12).toString()}:${Random().nextInt(59)} ${Random().nextBool() ? "AM" : "PM"}")),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 40.0, right: 20.0),
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
                }),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
