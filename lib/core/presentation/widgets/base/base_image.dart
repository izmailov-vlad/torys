import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../ui.dart';
import '../../presentation.dart';

enum ImageType {
  asset,
  network,
}

class BaseImage extends StatelessWidget {
  final ImageType imageType;
  final String imagePath;
  final double? height;
  final double? width;
  final double? radius;
  final BoxFit? fit;
  final Color? color;
  final VoidCallback? onTap;

  const BaseImage({
    Key? key,
    required this.imageType,
    required this.imagePath,
    this.height,
    this.width,
    this.radius,
    this.fit,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget image;
    if (imageType == ImageType.asset) {
      image = Image.asset(
        imagePath.isNotEmpty ? imagePath : AppImages.book,
        color: color,
        height: height,
        width: width,
        fit: BoxFit.contain,
      );
    } else {
      image = imagePath.isNotEmpty
          ? FancyShimmerImage(
              imageUrl: imagePath,
              boxFit: fit ?? BoxFit.contain,
              height: height ?? 300,
              width: width ?? 300,
            )
          : Image.asset(
              AppImages.bookPlaceholder,
              color: color,
              height: height ?? 25.h,
              width: width ?? 35.w,
              fit: BoxFit.fill,
            );
    }
    if (onTap != null) {
      image = GestureDetector(
        onTap: onTap,
        child: image,
      );
    }
    return radius != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(radius!),
            child: image,
          )
        : image;
  }
}
