import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Classes/Post.dart';
import '../Classes/User.dart';
import '../eg. Colors.dar.dart';

class PosttileCommunity extends StatefulWidget {
  List<Post> posts;

  PosttileCommunity({Key? key, required this.posts}) : super(key: key);

  @override
  State<PosttileCommunity> createState() => _PosttileCommunity(posts);
}

class _PosttileCommunity extends State<PosttileCommunity> {
  List<Post> posts;

  _PosttileCommunity(this.posts);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          int i = index;
          return Column(
            children: [
              postTile(posts[index]),
              Container(
                height: 100,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: posts[i].comments?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.grey[200],
                        child: ListTile(
                          title: Text(posts[i].user?.username ?? 'nulllll',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            posts[i].comments?.elementAt(index).content ??
                                'nulllllllll',
                            style: TextStyle(color: orangeblack),
                          ),
                        ),
                      );
                    }),
              )
            ],
          );
        },
      ),
    );
  }

  Widget postTile(Post post) {
    return Container(
      height: 600,
      color: Colors.black,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Expanded(
            child: Container(
              height: 100,
              width: 420,
              child: Card(
                shadowColor: Colors.white,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              post.user?.username ?? "nnull",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            post.createdAt.toString().substring(0, 19),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          'assets/images/iconBlue.jpg',
                          width: 100,
                          height: 100,
                          //  fit:BoxFit.fill
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Image.asset(
              'assets/images/iconPurple.jpg',
              height: 400,
              width: 400,
            ),
          ),
          Positioned(
              top: 550,
              left: 10,
              child: Text(post.content,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ))),
          Positioned(
              top: 510,
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
}
