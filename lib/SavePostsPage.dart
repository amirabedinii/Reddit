import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reddit/Classes/Post.dart';
import 'package:reddit/Classes/User.dart';
import 'package:reddit/Feed/PostTileFeed.dart';
import 'package:shamsi_date/shamsi_date.dart';

class SavedPostsPage extends StatefulWidget {
  List<Post> posts;
  User user;
  SavedPostsPage({Key? key,required this.posts,required this.user}) : super(key: key);

  @override
  State<SavedPostsPage> createState() => _SavedPostsPageState();
}

class _SavedPostsPageState extends State<SavedPostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Posts'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.posts.length,
            itemBuilder: (BuildContext context, int index) {
              int i = index;
              return postTile(widget.posts[index]);
            }),
      ),
    );
  }
  Widget postTile(Post post) {
    print(post.comments?.length.toString()??"null"+"from posttile");
    return Container(
      height: 600,
      color: Colors.black,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Flex(
            direction: Axis.horizontal,
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
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                post.user?.username ?? "nnull",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                format1(post.createdAt?.toJalali())??
                                    "nnull",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            //alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 15),
                            child: Image.asset(
                              post.user?.profileImage?.path ??
                                  "assets/images/iconBlue.jpg",
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
            ],
          ),
          Positioned(
            top: 100,
            child: Image.asset(
              post.image?.path ?? "assets/images/iconBlue.jpg",
              height: 400,
              width: 400,
            ),
          ),
          Positioned(
              top: 550,
              left: 10,
              child: Text(post?.content ?? "nnull",
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
                    margin : EdgeInsets.symmetric(horizontal: 20),
                    child: IconButton(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      onPressed: (){
                        setState((){
                          if(widget.user.savedPosts.contains(post)??false)
                            widget.user.savedPosts.remove(post);
                          else
                            widget.user.savedPosts.add(post);
                        });
                      }, icon: Icon(
                      FontAwesomeIcons.save,
                      color: widget.user.savedPosts.contains(post)??false?
                      Colors.red :Colors.white,
                      size: 30,
                    ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: IconButton(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      onPressed: () {
                        setState(() {
                          if (post.likes.contains(widget.user))
                            post.likes.remove(widget.user);
                          else {
                            post.likes.add(widget.user);
                            if(post.dislikes.contains(widget.user))
                              post.dislikes.remove(widget.user);
                          }
                          print(post.likes.length);
                        });
                      },
                      icon: Icon(
                        FontAwesomeIcons.thumbsUp,
                        color: post.likes.contains(widget.user)
                            ? Colors.yellowAccent
                            : Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (post.dislikes.contains(widget.user))
                            post.dislikes.remove(widget.user);
                          else {
                            post.dislikes.add(widget.user);
                            if(post.likes.contains(widget.user))
                              post.likes.remove(widget.user);
                          }
                        });
                      },
                      icon: Icon(
                        FontAwesomeIcons.thumbsDown,
                        color: post.dislikes.contains(widget.user)
                            ? Colors.redAccent
                            : Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
  String format1(d) {
    final f = d.formatter;

    return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
  }
}

