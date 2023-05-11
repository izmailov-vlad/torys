part of domain;

extension CommentModelExtension on CommentModel {
  CommentUiModel toUiModel() {
    return CommentUiModel(
      id: id,
      text: text,
      user: user.toUserUiModel(),
      liked: liked,
    );
  }
}
