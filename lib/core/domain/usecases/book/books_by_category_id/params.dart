part of domain;

class BooksByCategoryIdParams {
  final int id;
  final PaginationModel pagination;

  const BooksByCategoryIdParams({
    required this.id,
    required this.pagination,
  });
}