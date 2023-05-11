part of data;
extension CommentsExtension on CommentsDto {
  CommentsModel toModel() {
    return CommentsModel(comments: data.map((e) => e.toModel()).toList());
  }
}