part of domain;

extension CommentsModelExtension on CommentsModel {
  CommentsUiModel toUiModel() {
    return CommentsUiModel(
      comments: comments.map((e) => e.toUiModel()).toList(),
    );
  }
}
