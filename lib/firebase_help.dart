// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:uuid/uuid.dart';

class FirebaseFileHelper {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> funcUploadFileIntoFireBaseStorage(File file) async {
    try {
      UploadTask uploadTask = _storage
          .ref()
          .child("pictures")
          // .child(const Uuid().v1())
          .putFile(file);

      // BELOW 5 LINES ARE ONLY FOR PRINTING THE UPLOAD PERCENTAGE
      StreamSubscription<TaskSnapshot> taskSubscription =
          uploadTask.snapshotEvents.listen((snapshot) {
        double percentage =
            snapshot.bytesTransferred / snapshot.totalBytes * 100;
        print('Upload progress: $percentage%');
      });

      TaskSnapshot taskSnapshot = await uploadTask;
      //GET DOWNLOADURL VIA THSI UPLOADTASK THAT I CREATED ABOVE
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      // IF UPLOAD IS COMPLETED THEN ONE SHOULD STOP/FREE THIS TASKSUBSCRIPTION
      taskSubscription.cancel();
      return downloadUrl;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  Future<File?> funcRetrieveFileFromFireBaseStorage(String fileURL) async {
    //FILEURL IS JUST THE DOWNLOADURL THAT WE STORED IN THE FIRESTORE
    try {
      // NOTE ABOVE FILEURL IS JUST A URL, SO U CAN SIMPLY USE IMAGE.NETWORK(FILEURL,HEIGHT:100,WIDTH:100);  HERE TO GET THIS IMAGE OK
      //
      // OR INSTEAD YOU CAN ALSO CONVERT THIS URL INTO A FILE AND RETURN THIS FILE AS SHOWN BELOW,
      //BUT METHOD 1 IS BETTER TO DO
      File file;
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = '${tempDir.path}/tempFile.png';

      await _storage.refFromURL(fileURL).writeToFile(File(tempPath));
      file = File(tempPath);
      return file;
    } catch (e) {
      print('Error retrieving file: $e');
      return null;
    }
  }
}
