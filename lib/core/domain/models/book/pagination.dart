part of domain;

class PaginationModel {
  final int startIndex;
  final int maxResult;

  const PaginationModel({
    required this.startIndex,
    required this.maxResult,
  });
}