import 'dart:developer';
import 'dart:io';

import 'package:chothuexemay_owner/utils/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

class FirebaseStorageCustom {
  Future<String> uploadFile(File image) async {
    String fileNameInFireBaseStorage =
        "bike" + DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = storage
        .ref()
        .child(StringConstants.FIREBASE_FOLDER_IMAGE_BIKE)
        .child(fileNameInFireBaseStorage);
    UploadTask uploadTask = ref.putFile(image);
    uploadTask.whenComplete(() async {
      await ref.getDownloadURL();
    }).catchError((onError) {
      fileNameInFireBaseStorage = "";
      log(onError);
    });
    return fileNameInFireBaseStorage;
  }

  Future<void> deleteFile(String filePath) async {
    storage
        .refFromURL(filePath)
        .delete()
        .whenComplete(() => 'Deleted $filePath')
        .onError((error, stackTrace) => log(error.toString()));
  }
}
