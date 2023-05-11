part of presentation;

class VolumeInfo {
  final String title;
  final String subtitle;
  final List<String> authors;
  final double averageRating;
  final ImageLinksUiModel? imageLinks;

  const VolumeInfo({
    required this.title,
    required this.subtitle,
    required this.averageRating,
    required this.authors,
    required this.imageLinks,
  });
}
