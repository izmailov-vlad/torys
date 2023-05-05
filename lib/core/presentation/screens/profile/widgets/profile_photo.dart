import '../../../../../ui.dart';
import '../../../widgets/base/base_image.dart';

class ProfilePhoto extends StatelessWidget {
  final String imagePath;

  const ProfilePhoto({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
        ),
        BaseImage(
          imageType: ImageType.asset,
          imagePath: imagePath,
        ),
      ],
    );
  }
}
