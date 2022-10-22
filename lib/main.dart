import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reddit/Classes/Comment.dart';
import 'package:reddit/splash.dart';
import 'Classes/Community.dart';
import 'Classes/Post.dart';
import 'Classes/User.dart';
import 'Feed/FeedPage.dart';
import 'SignUp/SingUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reddit AP Project',
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Colors.black,
        accentColor: Colors.black,
      ),
      home: const Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User>? users;
  late User mainUser;
  List<Post> posts = [];
  List<comment> comments = [];

  @override
  initState() {
    super.initState();
    posts = [
      Post(
        id: '1',
        title: 'This is a title',
        image: File("assets/images/iconPurple.jpg"),
        content: 'This is a content',
      ),
      Post(
        id: '2',
        title: 'This is a title',
        image: File("assets/images/iconPurple.jpg"),
        content: 'This is a content',
      ),
      Post(
        id: '3',
        title: 'This is a title',
        image: File("assets/images/iconPurple.jpg"),
        content: 'This is a content',
      ),
      Post(
        id: '4',
        title: 'This is a title',
        image: File('assets/images/iconPurple.jpg'),
        content: 'This is a content',
      ),
    ];
    users = [
      User(
        username: 'useruser1',
        password: 'passPASS1',
      ),
      User(
        username: 'user2',
        password: 'pass2',
      ),
    ];
    Community selectedCommunity = new Community(
      name: "Test",
      description: "Test",
      admins: [users![0]],
    );
    comments =[
      comment(
        content: "This is a comment11",
        commenter: users![0],
        post: posts[0],
      ),
      comment(
        content: "This is a comment22",
        commenter: users![0],
        post: posts[0],
      ),
      comment(
        content: "This is a comment33",
        commenter: users![0],
        post: posts[0],
      ),
      comment(
        content: "This is a comment44",
        commenter: users![0],
        post: posts[0],
      ),
    ];

    users![0].communities.add(selectedCommunity);
    posts[0].comments = comments;
    posts[1].comments = comments;
    posts[2].comments = comments;
    users![0].Posts=posts;
    users![1].Posts=posts;
    mainUser = users![0];
    print(users?[0].Posts[0].comments?.length);
    print(posts[0].comments?.length.toString()??"null");
  }
  // users.add( User(username : "user",password: "user"));
  void addUser(User user) {
    setState(() {
      users?.add(user);
      print("fromadduser");
      for (var i = 0; i < users!.length; i++) {
        print(users?.elementAt(i)?.username);
      }
    });
  }

  void containsUser(User user) {
    setState(() {
      for (User u in users!) {
        if (u.username == user.username && u.password == user.password) {
          print("zxfhjzih");
          mainUser = user;
        }
      }
    });
  }

  void addComment(comment comment, Post post) {
    setState(() {
      post.comments?.add(comment);
    });
  }

  void addPost(Post post, User user) {
    setState(() {
      user.Posts.add(post);
    });
  }

  void addCommunity(Community community, User user) {
    setState(() {
      user.communities.add(community);
    });
  }

  // users.add( User(username : "user",password: "user"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: Alignment.center,
            child: Text(widget.title, style: TextStyle(color: Colors.white))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Sign Up'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignUpPage(
                            addUser: addUser,
                            users: users,
                            containsUser: containsUser,
                            addComment: addComment,
                            addPost: addPost,
                            addComunity: addCommunity,
                          )),
                );
              },
            ),
            RaisedButton(
              onPressed: () {
                mainUser = users![0];
                // need to change later
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FeedPage(
                          users: users,
                          user: mainUser,
                          addCommunity: addCommunity,
                          addPost: addPost,
                          addComment: addComment)),
                );
              },
              child: Text('Feed'),
            )
          ],
        ),
      ),
    );
  }
}
