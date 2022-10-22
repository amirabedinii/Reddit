import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reddit/Classes/Comment.dart';
import 'package:reddit/Classes/Comment.dart';
import 'package:reddit/Classes/Post.dart';
import 'package:reddit/Classes/User.dart';
import 'package:shamsi_date/shamsi_date.dart';

class PostPage extends StatefulWidget {
  Post post;
  User user;
  Function addComment;

  PostPage(
      {Key? key,
      required this.user,
      required this.post,
      required this.addComment})
      : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController _commentController = TextEditingController();

  initState() {
    super.initState();
    _commentController = TextEditingController();
  }

  dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      height: 350,
                      child: Image.asset(
                        'assets/images/iconPurple.jpg',
                        height: 350,
                        width: 350,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: IconButton(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            onPressed: () {
                              setState(() {
                                if (widget.post.likes.contains(widget.user))
                                  widget.post.likes.remove(widget.user);
                                else
                                  widget.post.likes.add(widget.user);
                                print(widget.post.likes.length);
                              });
                            },
                            icon: Icon(
                              FontAwesomeIcons.heart,
                              color: widget.post.likes.contains(widget.user)
                                  ? Colors.red
                                  : Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (widget.post.dislikes.contains(widget.user))
                                  widget.post.dislikes.remove(widget.user);
                                else
                                  widget.post.dislikes.add(widget.user);
                              });
                            },
                            icon: Icon(
                              FontAwesomeIcons.thumbsDown,
                              color: widget.post.dislikes.contains(widget.user)
                                  ? Colors.yellowAccent
                                  : Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                anchorPoint: Offset(0, 0),
                                useSafeArea: true,
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Add Comment"),
                                      actions: <Widget>[
                                        TextField(
                                          controller: _commentController,
                                          decoration: InputDecoration(
                                            hintText: "Comment",
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            FlatButton(
                                              child: Text('Cancel',
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            FlatButton(
                                              child: Text('Add',
                                                  style: TextStyle(
                                                      color: Colors.green)),
                                              onPressed: () {
                                                widget.addComment(
                                                    comment(
                                                        content:
                                                            _commentController
                                                                .text,
                                                        commenter: widget.user,
                                                        post: widget.post),
                                                    widget.post);
                                                print(widget
                                                    .post.comments?.last.content);
                                                print(widget.post.comments?.last
                                                    .commenter?.name);
                                                print(
                                                    widget.post.comments?.length);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ));
                          },
                          child: Text(
                            "Add Comment",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Text(
                      widget.post?.content ?? "nnull",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(child: ListView.builder(
              itemCount: widget.post.comments?.length ?? 0,
              itemBuilder: (context, index) {
                return CommentCard(
                  comment: widget.post.comments![index],
                  user: widget.user,
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
String format1(d) {
  final f = d.formatter;

  return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
}
Widget CommentCard({required comment comment, required User user}) {
  return ListTile(
    title: Text(comment.commenter?.name ?? "null"),
    subtitle: Text(comment.content ?? "null"),
  );
}

