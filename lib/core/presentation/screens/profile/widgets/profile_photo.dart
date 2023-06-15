import 'dart:io';

import '../../../../../ui.dart';
import 'dart:convert' show utf8, base64;

import '../../../presentation.dart';

class ProfilePhoto extends StatelessWidget {
  final String? imagePath;

  const ProfilePhoto({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = imagePath != null
        ? BaseImage(
            fit: BoxFit.contain,
            imageType: ImageType.network,
            imagePath: imagePath!,
            radius: 10,
          )
        : Image.asset(AppImages.personNoBorder);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 250,
          height: 250,
          child: image,
        ),
      ],
    );
  }
}
