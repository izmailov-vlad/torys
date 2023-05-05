import 'package:sizer/sizer.dart';

import '../../../../../../ui.dart';
import '../../../../widgets/base/base_image.dart';
import '../../../../widgets/base/base_title.dart';

class ProfileItemPage extends StatelessWidget {
  final String title;

  const ProfileItemPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppMargin.mediumMargin.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              BaseImage(
                imageType: ImageType.asset,
                imagePath: AppImages.settings,
              ),
              SizedBox(width: AppPadding.mediumPadding.w),
              BaseText(
                title: title,
                style: Theme.of(context).textTheme.headlineLarge?.toBold(),
              ),
            ],
          ),
          BaseImage(
            imageType: ImageType.asset,
            imagePath: AppImages.arrowCircleRight,
          ),
        ],
      ),
    );
  }
}
