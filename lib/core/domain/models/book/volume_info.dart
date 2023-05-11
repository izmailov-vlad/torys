part of domain;

class VolumeInfoModel {
  final String title;
  final String subtitle;
  final List<String> authors;
  final double averageRating;
  final ImageLinksModel? imageLinks;

  VolumeInfoModel({
    required this.subtitle,
    required this.authors,
    required this.averageRating,
    required this.title,
    required this.imageLinks,
  });
}
