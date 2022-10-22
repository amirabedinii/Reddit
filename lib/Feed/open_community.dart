import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/Feed/PostTileCommunity.dart';
import '../Classes/Community.dart';
import '../Classes/Post.dart';
import '../Classes/User.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../eg. Colors.dar.dart';

class OpenCommunity extends StatefulWidget {
  OpenCommunity(
      {required Key key, required this.user, required this.community, required this.removeCommunity})
      : super(key: key);

  User user;
  Community community;
  Function removeCommunity;

  @override
  State<OpenCommunity> createState() => _OpenCommunityState(user: user, community: community, removeCommunity: removeCommunity);
}

class _OpenCommunityState extends State<OpenCommunity> {
  User user;
  Community community;
  Function removeCommunity;
  PageController pageController =
  PageController(initialPage: 0, viewportFraction: 1);
  int currentPage = 0;
  bool onhome = true;
  _OpenCommunityState({required this.user, required this.community, required this.removeCommunity});

  @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text('Communities'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 110,
              child: Card(
                  shadowColor: Colors.white,
                  elevation: 10,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            'assets/images/iconBlue.jpg',
                            width: 100,
                            height: 100,
                            //  fit:BoxFit.fill
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(50),
                          child: ListTile(
                            title: Text(widget.community.name,
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                            subtitle: Text("\n\n" + widget.community.description + "\n\n\n",
                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.edit),
                          ),
                        ),
                        Expanded(
                            child: Row(
                              children: [
                                iconAndSub(user.Posts.length.toString(),
                                    FontAwesomeIcons.comments),
                                iconAndSub(user.Posts.length.toString(),
                                    FontAwesomeIcons.comments),
                                iconAndSub(user.Posts.length.toString(),
                                    FontAwesomeIcons.comments),
                                //  iconAndSub(user!.communities!.length.toString(),FontAwesomeIcons.users),
                              ],
                            )),
                      ],
                    ),
                  )),
            ),
            Expanded(
              child: Container(
                  child: ListView.builder(
                    itemCount: user.Posts.length,
                    itemBuilder: (context, index) {
                      print(user.Posts.length.toString());
                      int i = index;
                      return Column(
                        children: [
                          postTile(user.Posts[index]),
                          Container(
                            height: 100,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: user.Posts[i].comments?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.grey[200],
                                    child: ListTile(
                                      title: Text(user.name ?? 'nulllll',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                          user.Posts[i].comments![index].content ??
                                              'nulllll',
                                        style: TextStyle(color: orangeblack),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
  Widget iconAndSub(String sub, dynamic icon) => Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Column(
      children: [
        Icon(icon, size: 60, color: orangepurple),
        Text(sub),
      ],
    ),
  );

  Widget drawer() => Drawer(
    backgroundColor: blackorange,
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          curve: Curves.easeIn,
          child: Text(
            'Profile',
            style: TextStyle(color: orangepurple),
          ),
          decoration: BoxDecoration(
            color: purpleorange,
          ),
        ),
        ListTile(
          title: Text('Home', style: TextStyle(color: orangepurple)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Profile', style: TextStyle(color: orangepurple)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Logout', style: TextStyle(color: orangepurple)),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );

  Widget postTile(Post post) {
    return Container(
      height: 470,
      color: Colors.black,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/iconPurple.jpg',
            height: 400,
            width: 400,
          ),
          Positioned(
              top: 440,
              left: 10,
              child: Text(post.content,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ))),
          Positioned(
              top: 410,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Icon(
                      FontAwesomeIcons.comment,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Icon(
                      FontAwesomeIcons.flushed,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

     */
    return Card(
      color: Color.fromARGB(255, 40, 90, 82),
      shadowColor: Colors.teal,
      elevation: 8.0,
      child: ListTile(
        title: Text(widget.community.name,
            style: const TextStyle(
                fontSize: 16.0, fontWeight: FontWeight.bold)),
        leading: CircleAvatar(
          radius: 20.0,
          backgroundImage: NetworkImage(widget.community.image!),
        ),
        trailing: SizedBox(
          width: 52.0,
          child: Row(
            children: [
              GestureDetector(
                child: const Icon(Icons.delete),
                onTap: () {
                  widget.removeCommunity();
                },
              ),
              GestureDetector(
                child: const Icon(Icons.keyboard_arrow_right),
                onTap: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}