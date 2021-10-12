import 'dart:developer';
import 'dart:io';
import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageStorageViewModel {
  final picker = ImagePicker();
  Future uploadImageToFirebase(File image) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String fileNameInFireBaseStorage =
        "image1" + DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = storage
        .ref()
        .child(StringConstants.FIREBASE_FOLDER_IMAGE_BIKE)
        .child(fileNameInFireBaseStorage);
    UploadTask uploadTask = ref.putFile(image);
    uploadTask.whenComplete(() async {
      await ref.getDownloadURL();
    }).catchError((onError) {
      log(onError);
    });
    return fileNameInFireBaseStorage;
  }
}
