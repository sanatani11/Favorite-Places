import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }

  final void Function(File image) onPickImage;
}

class _ImageInputState extends State<ImageInput> {
  File? _takenPicture;
  void _takePicture() async {
    final imagePicker = ImagePicker();

    final imagePicked =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (imagePicked == null) return;

    setState(() {
      _takenPicture = File(imagePicked.path);
    });
    widget.onPickImage(_takenPicture!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      icon: const Icon(Icons.camera),
      label: const Text('Take Picture'),
    );
    if (_takenPicture != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _takenPicture!,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2))),
      height: 250,
      width: double.infinity,
      child: content,
    );
  }
}
