part of presentation;

class CommentUiModel {
  final int id;
  final String text;
  final bool liked;
  final UserUiModel user;

  CommentUiModel({
    required this.id,
    required this.text,
    required this.user,
    required this.liked,
  });
}