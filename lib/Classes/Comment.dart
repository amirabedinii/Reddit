import 'Like.dart';
import 'Post.dart';
import 'User.dart';

class comment {
  String? content;
  User? commenter;
  DateTime? createdAt;
  List<comment>? replies;
  List<User> likes= [];
  List<User> dislikes= [];
  Post post;
  comment({required this.content, required this.commenter, this.createdAt, this.replies, required this.post});
  void addReply(comment reply){
    replies?.add(reply);
  }
  void addLike(User like){
    likes?.add(like);
  }
  void removeLike(like){
    if(likes == null){
      likes = [];
    }
    likes?.remove(like);
  }
  bool containsLike(Like like){
    if(likes == null){
      likes = [];
    }
    return likes?.contains(like)??false;
  }
  void changeContent(String content){
    this.content = content;
  }
  void removeReply(comment reply){
    if(replies == null){
      replies = [];
    }
    replies?.remove(reply);
  }

}