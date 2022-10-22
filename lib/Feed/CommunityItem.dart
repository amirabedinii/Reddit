import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/Feed/open_community.dart';
import '../Classes/Community.dart';
import '../Classes/User.dart';

class CommunityItem extends StatefulWidget {
  CommunityItem({required Key key, required this.community, required this.user}) : super(key: key);

  Community community;
  User user;

  @override
  State<CommunityItem> createState() => _CommunityItemState(user: user, community: community);
}

class _CommunityItemState extends State<CommunityItem> {
  Community community;
  User user;

  _CommunityItemState({required this.community, required this.user});

  List<Community> communities = [Community(name: 'r/Valorant', description: 'Cringe', admins: [], image: 'https://tr.rbxcdn.com/4f24f514964225c249b4dc004ebcbe64/420/420/Image/Png', ),
    Community(name: 'r/EA Sport', description: 'Cringe', admins: [], image: 'https://media.contentapi.ea.com/content/dam/eacom/en-us/common/october-ea-ring.png'),
    Community(name: 'r/Star wars', description: 'Cringe', admins: [], image: 'https://images.bonanzastatic.com/afu/images/0282/4b02/773d_5392595648/s-l1600.jpg'),
    Community(name: 'r/Champions league', description: 'Cringe', admins: [], image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_FpknB8aQlF_bR6SZZcCWDXUCGGaWK2bzzQ&usqp=CAU'),
    Community(name: 'r/Real Madrid', description: 'Cringe', admins: [], image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStMY_bWW9MbAFxNtG6RbQBLpnUZkyxviFmOA&usqp=CAU')
  ];

  void addCommunity(Community community) {
    setState(() {
      communities.add(community);
    });
  }

  void removeCommunity(int index) {
    setState(() {
      communities.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(widget.community.name),
        leading: Icon(Icons.question_mark_sharp),
        trailing: Container(
          width: 60,
          child: Row(
            children: [
            GestureDetector(
              child: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return OpenCommunity(
                        community: widget.community,
                        removeCommunity: removeCommunity,
                        user: widget.user,
                        key: Key("value"),
                      );
                    },
                  ),
                );
              },
            )
            ],
          ),
        ),
      ),
    );
  }
}