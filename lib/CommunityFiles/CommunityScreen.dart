
import 'package:flutter/material.dart';

import '../Classes/Community.dart';
import '../Classes/User.dart';
import 'AddCommunity.dart';
import 'ListOfCommunities.dart';


class CommunityScreen extends StatefulWidget {
  User user;

  CommunityScreen({required Key key, required this.user}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState(user: user);
}

class _CommunityScreenState extends State<CommunityScreen> {
  User user;


  _CommunityScreenState({required this.user});

  List<Community> communities =
  [Community(name: 'r/Valorant', description: 'Cringe', admins: [], image: 'https://tr.rbxcdn.com/4f24f514964225c249b4dc004ebcbe64/420/420/Image/Png', ),
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
    return SafeArea(
      child: Scaffold(
        
        body: Center(
          child: ListView.builder(
            itemCount: communities.length,
            itemBuilder: (context, index) {
              return ShowCommunityList(communities[index], () => removeCommunity(index), key: Key("key"),);
            },),),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return AddCommunity(
                addCommunity: addCommunity, key: Key("value"),
              );
            }));
          },
          hoverColor: Colors.teal,
        ),
      ),);
  }
}
