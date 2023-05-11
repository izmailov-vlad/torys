import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../presentation.dart';

class BaseCamera extends StatefulWidget {
  @override
  _BaseCameraState createState() => _BaseCameraState();
}

class _BaseCameraState extends State<BaseCamera> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _getImage(ImageSource.camera),
            tooltip: 'Take Photo',
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () => _getImage(ImageSource.gallery),
            tooltip: 'Pick Image',
            child: Icon(Icons.add_photo_alternate),
          ),
        ],
      ),
    );
  }
}