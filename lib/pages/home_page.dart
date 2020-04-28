import 'package:camera/camera.dart';
import 'package:chatoff/screens/call_screen.dart';
import 'package:chatoff/screens/camera_screen.dart';
import 'package:chatoff/screens/chat_screen.dart';
import 'package:chatoff/screens/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chatoff/stores/login_store.dart';
import 'package:chatoff/theme.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;
  HomePage({this.cameras});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(
      builder: (_, loginStore, __) {
        return Scaffold(
          appBar: AppBar(
            title: Text("ChatOff"),
            backgroundColor: MyColors.lightGreen,
            elevation: 0.7,
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(text: "CHATS"),
                Tab(
                  text: "STATUS",
                ),
                Tab(
                  text: "CALLS",
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed:(){
                  loginStore.signOut(context);
                },
              ),
              Icon(Icons.search),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
              ),
              Icon(Icons.more_vert)
            ],
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              CameraScreen(widget.cameras),
              ChatScreen(),
              StatusScreen(),
              CallsScreen(),
            ],
          ),
          floatingActionButton: showFab
              ? FloatingActionButton(
            backgroundColor: MyColors.lightGreen,
            child: Icon(
              Icons.message,
              color: Colors.white,
            ),
            onPressed: () => print("open chats"),
          )
              : null,
        );
      },
    );
  }
}



// loginStore.signOut(context);