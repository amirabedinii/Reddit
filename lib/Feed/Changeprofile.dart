import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reddit/Classes/User.dart';

class ChangeProfile extends StatefulWidget {
  User user;

  ChangeProfile({Key? key, required this.user}) : super(key: key);

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  final ImagePicker _picker = ImagePicker();
  TextEditingController _nameC = TextEditingController();
  TextEditingController _emailC = TextEditingController();
  TextEditingController _passwordC = TextEditingController();
  TextEditingController _confirmPasswordC = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameC = TextEditingController();
    _emailC = TextEditingController();
    _passwordC = TextEditingController();
    _confirmPasswordC = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Profile'),
        backgroundColor: Colors.black,
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.white],
            ),
          ),
          child: SingleChildScrollView (
            child: Column(
              children: [
                FadeInUp(
                  duration: Duration(milliseconds: 1000),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      child: Image.asset(
                        widget.user.profileImage?.path??"assets/images/iconBlue.jpg",
                        fit: BoxFit.fill,
                      ),
                      radius: 100,
                    ),
                  ),
                ),
               FadeInUp(
                 duration: Duration(milliseconds: 1000),
                 child: Container(
                   alignment: Alignment.topCenter,
                   child: RaisedButton(
                     onPressed: () async {
                       final pickedFile = await _picker.getImage(
                         source: ImageSource.gallery,
                         imageQuality: 50,
                       );
                       if (pickedFile != null) {
                         setState(() {
                           widget.user.profileImage = File(pickedFile.path);
                         });
                       }
                     },
                     child: Text('Change Profile Image'),
                   ),
                 ),
               ),
               FadeInLeft(
                  duration: Duration(milliseconds: 1500),
                 child: Container(
                   child: Column(
                     children: [
                       TextField(
                          controller: _nameC,
                          decoration: InputDecoration(
                            labelText: 'ReName',
                            border: OutlineInputBorder(),
                          ),
                        ),
                       RaisedButton(onPressed: () {
                         setState(() {
                           widget.user.name = _nameC.text;
                         });
                       }, child: Text('ReName')),
                     ],
                   ),
                 ),
               ),
                FadeInRight(
                  duration: Duration(milliseconds: 1500),
                  child: Container(
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailC,
                          decoration: InputDecoration(
                            labelText: 'ReEmail',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        RaisedButton(onPressed: () {
                          setState(() {
                            widget.user.email = _emailC.text;
                          });
                        }, child: Text('ReEmail')),
                      ],
                    ),
                  ),
                ),
                FadeInDown(
                  duration: Duration(milliseconds: 1500),
                  child: Container(
                    child: Column(
                      children: [
                        TextField(
                          controller: _passwordC,
                          decoration: InputDecoration(
                            labelText: 'RePassword',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: _confirmPasswordC,
                          decoration: InputDecoration(
                            labelText: 'Confirm RePassword',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        RaisedButton(onPressed: () {
                          setState(() {
                            if(_passwordC.text == _confirmPasswordC.text){
                              widget.user.password = _passwordC.text;
                            }
                          });
                        }, child: Text('RePassword')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
