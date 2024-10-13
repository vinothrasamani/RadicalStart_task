import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:redicalstart_tasks/widgets/imagePicker/custom_label_button.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _selectedImage;
  final _imagePicker = ImagePicker();

  void uploadImage(bool isCamera) async {
    XFile? image;
    if (isCamera) {
      Permission cameraStatus = Permission.camera;
      if (await cameraStatus.isGranted) {
        image = await _imagePicker.pickImage(source: ImageSource.camera);
      } else {
        final status = await Permission.camera.request();
        if (status.isGranted) {
          image = await _imagePicker.pickImage(source: ImageSource.camera);
        }
      }
    } else {
      Permission galleryStatus = Permission.storage;
      if (await galleryStatus.isGranted) {
        image = await _imagePicker.pickImage(source: ImageSource.gallery);
      } else {
        final status = await Permission.storage.request();
        if (status.isGranted) {
          image = await _imagePicker.pickImage(source: ImageSource.gallery);
        }
      }
    }
    if (image != null) {
      setState(() {
        _selectedImage = File(image!.path);
      });
    }
    Navigator.pop(context);
  }

  void chooseOption() {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    showModalBottomSheet(
      backgroundColor: isDark
          ? const Color.fromARGB(255, 32, 32, 32)
          : const Color.fromARGB(255, 234, 234, 234),
      context: context,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.all(15),
          height: 150,
          child: Row(
            children: [
              CustomLabelButton(
                label: 'Camera',
                onTap: () {
                  uploadImage(true);
                },
                iconData: Icons.camera_alt,
              ),
              CustomLabelButton(
                label: 'Gallery',
                onTap: () {
                  uploadImage(false);
                },
                iconData: Icons.image,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImagePicker!'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Upload an Image which you want!',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 320,
                height: 250,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(46, 142, 142, 142),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all()),
                child: _selectedImage == null
                    ? Center(
                        child: IconButton.filled(
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                          padding: const EdgeInsets.all(12),
                          onPressed: chooseOption,
                        ),
                      )
                    : Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(
                height: 30,
              ),
              if (_selectedImage != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filled(
                      onPressed: chooseOption,
                      padding: const EdgeInsets.all(12),
                      icon: const Icon(
                        Icons.edit,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    IconButton.filled(
                      onPressed: () {},
                      padding: const EdgeInsets.all(12),
                      icon: const Icon(
                        Icons.check,
                        size: 30,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
