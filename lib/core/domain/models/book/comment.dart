part of domain;

class CommentModel {
  final int id;
  final String text;
  final bool liked;
  final UserModel user;
  final int likesCount;

  const CommentModel({
    required this.id,
    required this.text,
    required this.likesCount,
    required this.user,
    required this.liked,
  });
}
