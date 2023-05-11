part of data;

extension CommentExtension on CommentDto {
  CommentModel toModel() {
    return CommentModel(
      id: id,
      text: body,
      user: user.toModel(),
      liked: liked,
    );
  }
}
