
import 'dart:io';

import 'package:reddit/Classes/Community.dart';

import 'Post.dart';

class User {
  String? password;
  String? username;
  String? email;
  String? name;
  String? id;
  File? profileImage;
  String? bio;
  List<Post> Posts = [];
  List<Post> savedPosts= [];
  List<Community> communities = [];
  bool darkMode = false;

  User({ this.username,  this.password, this.email, this.name,  this.id,
    this.profileImage, this.bio});

  void addPost(Post post){
    if(!Posts.contains(post)) {
      Posts.add(post);
    }
  }

  void deletePost(Post post){
    if(Posts.contains(post)) {
      Posts.remove(post);
    }
  }

  void addCommunity(Community community){
    if(!communities.contains(community)) {
      communities.add(community);
    }
  }

  void removePost(Post post) {
    if(Posts.contains(post)) {
      Posts.remove(post);

    }
  }
  void removeCommunity(Community community) {
    if(communities.contains(community)) {
      communities.remove(community);
    }
  }
  void addSavedPost(Post post) {
    if(!savedPosts!.contains(post)) {
      savedPosts?.add(post);
    }
  }
  void removeSavedPost(Post post) {
    if(savedPosts!.contains(post)) {
      savedPosts?.remove(post);
    }
  }
  void setDarkMode(bool darkMode) {
    this.darkMode = darkMode;
  }
  bool getDarkMode() {
    return darkMode;
  }
  List<Post> getSavedPosts() {
    return savedPosts!;
  }
  List<Post> getPosts() {
    return Posts;
  }
  List<Community> getCommunities() {
    return communities;
  }
  String? getUsername() {
    return username;
  }
  String? getPassword() {
    return password;
  }
  String? getEmail() {
    return email;
  }
  String? getName() {
    return name;
  }
  String? getId() {
    return id;
  }
  Object? getProfileImage() {
    return profileImage;
  }
  String? getBio() {
    return bio;
  }


}