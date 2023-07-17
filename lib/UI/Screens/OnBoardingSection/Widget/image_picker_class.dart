import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<String> pickImage({ImageSource? source}) async {
  final picker = ImagePicker();

  RxString path = ''.obs;

  try {
    final getImage = await picker.pickImage(source: source!);

    if (getImage != null) {
      path.value = getImage.path;
    } else {
      path.value = '';
    }
  } catch (e) {
    log(e.toString());
  }

  return path.value;
}
