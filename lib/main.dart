// ignore_for_file: avoid_print

import 'dart:io';
import 'package:akash_mishra_firebase_helper/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:akash_mishra_firebase_helper/firebase_help.dart'; // Import your FirebaseHelper class here
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart'; // Import the ImagePicker package

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const YourPage(),
    );
  }
}

class YourPage extends StatefulWidget {
  const YourPage({Key? key}) : super(key: key);

  @override
  State<YourPage> createState() => _YourPageState();
}

class _YourPageState extends State<YourPage> {
  //
  final FirebaseFileHelper _firebaseHelper = FirebaseFileHelper();

  Future<void> _uploadFile() async {
    // create xfile first of all
    XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    // now make file from this xfile
    if (pickedImage != null) {
      File file = File(pickedImage.path);

      // Directory tempDir = await getTemporaryDirectory();
      // String tempPath = '${tempDir.path}/tempFile.png';

      // // ABOVE WE CREATED A PATH AND NOW WE WOULD FILL THIS FILE INTO THIS PATH VIA COPYSYNC METHOD
      // file.copySync(tempPath);

      String? downloadURL =
          await _firebaseHelper.funcUploadFileIntoFireBaseStorage(
        file,
      );

      if (downloadURL != null) {
        // File uploaded successfully, use the downloadURL
        print('File uploaded. Download URL: $downloadURL');
      } else {
        // Handle error in file upload
        print('File upload failed.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Upload Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _uploadFile,
          child: const Text("Upload"),
        ),
      ),
    );
  }
}
