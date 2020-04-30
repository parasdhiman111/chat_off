import 'package:chatoff/theme.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final String name;
  final String imgurl;
  ProfileView(this.name, this.imgurl);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(

            flexibleSpace: new FlexibleSpaceBar(

              title: new Text(name),
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(imgurl,
                  fit: BoxFit.cover,)
                ],
              ),

            ),
            backgroundColor: MyColors.lightGreen,


          ),

        ],
      )
    );
  }
}