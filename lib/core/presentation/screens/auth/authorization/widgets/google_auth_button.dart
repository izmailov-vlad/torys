import '../../../../presentation.dart';
import '../../../../widgets/base/base_image.dart';

class GoogleAuthButton extends StatelessWidget {
  final VoidCallback onPressed;

  GoogleAuthButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      onPressed: onPressed,
      icon: const BaseImage(
        imageType: ImageType.asset,
        imagePath: AppImages.icGoogle,
      ),
      label: Text(
        'Авторизация через Google',
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
