import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/Feed/CommunityItem.dart';

import '../Classes/Community.dart';
import '../Classes/User.dart';

class CommunityPage extends StatefulWidget {
  User user;
  CommunityPage({required Key key, required this.user}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState(user: user);
}

class _CommunityPageState extends State<CommunityPage> {
  User? user;

  _CommunityPageState({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Communities"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: user?.communities.length,
          itemBuilder: (context, index) {
            return CommunityItem(
              user: user!,
              community: user?.communities[index] ?? Community(name: "", description: "", admins: [user!]),
              key: Key("Community Item"),
            );
          },
        ),
      ),
    );
  }
}
