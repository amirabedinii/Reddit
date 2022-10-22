

import 'dart:io';

import 'package:reddit/Classes/Community.dart';

import 'Comment.dart';
import 'Like.dart';
import 'User.dart';

class Post{
  String title;
  String content;
  DateTime? createdAt;
  Community? community;
  Object? id;
  File? image;
  int? likeCount;
  List<User> likes = [];
  List<User> dislikes = [];
  List<comment> comments=[];
  User? user;

  Post({required this.title, required this.content, this.community, this.id, this.image, this.likeCount,this.user}){
    this.createdAt = DateTime.now();
  }
  void addComment(comment comment){
    comments?.add(comment);
  }
  void removeComment(comment comment){
    if(comments == null){
      comments = [];
    }
    comments?.remove(comment);
  }
  bool containsComment(comment comment){
    if(comments == null){
      comments = [];
    }
    return comments?.contains(comment)??false;
  }
  void addLike(User user){
    likes.add(user);
  }
  void removeLike(User user){
    likes.remove(user);
  }
  bool containsLike(User user){
    return likes.contains(user);
  }
  void changeContent(String content){
    this.content = content;
  }
  void changeTitle(String title){
    this.title = title;
  }
  void changeCommunity(Community community){
    this.community = community;
  }
  void changeImage(File image){
    this.image = image;
  }
  void changeLikeCount(int likeCount){
    this.likeCount = likeCount;
  }
  void changeUser(User user){
    this.user = user;
  }
  void changeCreatedAt(DateTime createdAt){
    this.createdAt = createdAt;
  }


}