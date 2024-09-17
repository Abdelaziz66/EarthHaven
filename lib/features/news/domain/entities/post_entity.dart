class PostEntity {
  final String? userName;
  final String? uId;
  final String? image;
  final String? userProfileImage;
  final String? caption;
  final String? tag;
  final String? postId;
  final String? date;

  PostEntity(
      {required this.userName,
      required this.uId,
      required this.image,
      required this.caption,
      required this.tag,
      required this.postId,
      required this.userProfileImage,
      required this.date});
}
