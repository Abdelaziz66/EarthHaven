import 'package:earth_haven/features/news/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel(
      {required super.userName,
      required super.uId,
      required super.caption,
      required super.tag,
      required super.postId,
      required super.userProfileImage,
      required super.date,
      required super.image});

  factory PostModel.fromJson(Map<String?, dynamic>? json) => PostModel(
      userName: json?['userName'],
      uId: json?['uId'],
      image: json?['image'],
      caption: json?['caption'],
      tag: json?['tag'],
      postId: json?['postId'],
      userProfileImage: json?['userProfileImage'],
      date: json?['date']);

  Map<String, dynamic> toMap() {
    return {
      'userName': super.userName,
      'uId': super.uId,
      'image': super.image,
      'caption': super.caption,
      'tag': super.tag,
      'postId': super.postId,
      'userProfileImage': super.userProfileImage,
      'date': super.date,
    };
  }
}
