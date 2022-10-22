import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:item_selector/item_selector.dart';

import '../Classes/Community.dart';
import '../Classes/Post.dart';
import '../Classes/User.dart';

class AddPost extends StatefulWidget {
  User user;
  Function addPost;

  AddPost({required Key key, required this.user, required this.addPost})
      : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState(user: user);
}

class _AddPostState extends State<AddPost> {
  User? user;
  Community? community;
  late TextEditingController titleC;
  late TextEditingController descC;
  late DateTime dateC;
  final ImagePicker _picker = ImagePicker();
  File? image;
  bool ispicked=false;

  _AddPostState({required this.user});

  @override
  void initState() {
    titleC = TextEditingController();
    descC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleC.dispose();
    descC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Post"),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(238, 192, 198, 1.0),
              Color.fromRGBO(126, 232, 250, 1.0)
            ],
          ),
        ),
        padding: const EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Column(children: [
            TextField(
              controller: titleC,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: descC,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final pickedFile =
                    await _picker.getImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    image = File(pickedFile.path);
                  });
                }
              },
              child: Text("Select Image"),
            ),
            Text(
              "Communities",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 300,
              color: Colors.white,
              child:  ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        trailing: Icon(
                          FontAwesomeIcons.thumbsUp,
                          color: (user?.communities.contains(community)??false)?Colors.yellowAccent:Colors.grey,
                        ),
                        title: Text(
                            user?.communities[index].name ?? "this is community"),
                        onTap: () {
                          setState(() {
                            if(!ispicked&&!(user?.communities.contains(community)??false)) {
                              community = user?.communities[index];
                              ispicked=true;
                            }else
                              {
                                community = null;
                                ispicked=false;
                              }
                          });
                        },
                      );
                    },
                    itemCount: user?.communities?.length ?? 0),
              ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
                    print("dtjkxzhjzhjzzhhj");
                    widget.addPost(
                      Post(
                        title: titleC.text,
                        content: descC.text,
                        community: community,
                        user: user,
                        image: image??File("assets/images/iconYellow.jpg"),
                      ),
                      user,
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text("Add Post"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
