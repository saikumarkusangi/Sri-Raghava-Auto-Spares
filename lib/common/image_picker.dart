import 'package:image_picker/image_picker.dart';

class ImagesPicker{

  ImagesPicker._privateConstructor();
  static final ImagesPicker _instance = ImagesPicker._privateConstructor();
  static ImagesPicker get instance => _instance;

  final ImagePicker picker = ImagePicker();
   imagePicker() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      return image.path;
    }
  }
}