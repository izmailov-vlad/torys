import '../../../../ui.dart';

enum ImageType {
  asset,
  network,
}

class BaseImage extends StatelessWidget {
  final ImageType imageType;
  final String imagePath;
  final double? height;
  final double? width;

  const BaseImage({
    Key? key,
    required this.imageType,
    required this.imagePath,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case ImageType.asset:
        return Image.asset(imagePath, fit: BoxFit.fill);
      case ImageType.network:
        return Image.network(
          imagePath,
          height: height,
          width: width,
        );
    }
  }
}
