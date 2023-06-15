part of domain;

class BooksByQueryParams {
  final String query;
  final PaginationModel pagination;

  BooksByQueryParams({
    required this.query,
    required this.pagination,
  });
}