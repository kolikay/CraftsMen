import 'package:image_picker/image_picker.dart';

class PickImage {
  static Future pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    } else {
      return 'failed';
    }
  }
}
