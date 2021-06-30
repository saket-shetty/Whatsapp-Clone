import 'package:flutter/material.dart';
import 'package:whatsapp_clone/tabs/calls_tab/call_tab_screen.dart';
import 'package:whatsapp_clone/tabs/chat_tab/chat_tab_screen.dart';
import 'package:whatsapp_clone/tabs/status_tab/status_tab_screen.dart';

class LandingPagecreen extends StatefulWidget {
  const LandingPagecreen({Key key}) : super(key: key);

  @override
  _LandingPagecreenState createState() => _LandingPagecreenState();
}

class _LandingPagecreenState extends State<LandingPagecreen> {
  Widget appBarTitle = Text("Whatsapp");
  Icon iconsSearch = Icon(Icons.search);

  List<String> settingsList = [
    "New group",
    "New broadcast",
    "WhatsApp Web",
    "Starred message",
    "Payments",
    "Settings"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: appBarTitle),
              IconButton(
                icon: iconsSearch,
                onPressed: () {
                  if (iconsSearch.icon == Icons.search) {
                    setState(
                      () {
                        iconsSearch = Icon(Icons.cancel);
                        appBarTitle = TextField(
                          style: new TextStyle(
                            color: Colors.white,
                          ),
                          decoration: new InputDecoration(
                              prefixIcon:
                                  new Icon(Icons.search, color: Colors.white),
                              hintText: "Search...",
                              hintStyle: new TextStyle(color: Colors.white)),
                        );
                      },
                    );
                  } else {
                    setState(() {
                      iconsSearch = Icon(Icons.search);
                      appBarTitle = Text("Whatsapp");
                    });
                  }
                },
              ),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (str) {},
              itemBuilder: (BuildContext context) {
                return settingsList.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
          bottom: tabs(),
          backgroundColor: Color(0xff075E54),
        ),
        body: TabBarView(
          children: [
            ChatTabScreen(),
            StatustabScreen(),
            CallTabScreen(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget tabs() {
    return TabBar(
      tabs: [
        Tab(
          text: "CHATS",
        ),
        Tab(
          text: "STATUS",
        ),
        Tab(
          text: "CALLS",
        ),
      ],
    );
  }
}
