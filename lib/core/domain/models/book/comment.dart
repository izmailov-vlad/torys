part of domain;

class CommentModel {
  final int id;
  final String text;
  final bool liked;
  final UserModel user;

  CommentModel({
    required this.id,
    required this.text,
    required this.user,
    required this.liked,
  });
}
