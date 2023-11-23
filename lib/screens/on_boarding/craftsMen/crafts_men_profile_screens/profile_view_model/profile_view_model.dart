import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileModelView extends ChangeNotifier {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final _image = await ImagePicker().pickImage(source: source);
      if (_image == null) return;
      final _imageTem = File(_image.path);
      image = _imageTem;
      notifyListeners();
    } catch (e) {
      // print('failed to pick image: $e');
    }
  }
}
