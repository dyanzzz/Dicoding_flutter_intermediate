import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeProvider extends ChangeNotifier {
  String? imagePath;

  void setImagePath(String? value) {
    imagePath = value;
    notifyListeners();
  }

  XFile? imageFile;

  void setImageFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }
}
