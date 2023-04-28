import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:notio/main.dart';
import 'package:http/http.dart' as http;

import '../Screens/Story/storyUpload.dart';
import '../utility.dart';

class UploadStory {
  storyUpload(BuildContext context) async {
    ImagePickerPlus picker = ImagePickerPlus(context);
    SelectedImagesDetails? details = await picker.pickBoth(
      source: ImageSource.both,

      /// On long tap, it will be available.
      multiSelection: false,
      galleryDisplaySettings:
          GalleryDisplaySettings(cropImage: true, showImagePreview: true),
    );
    if (details != null) await displayDetails(details, context);
  }

  Future<void> displayDetails(
      SelectedImagesDetails details, BuildContext context) async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) {
          return DisplayImages(
              selectedBytes: details.selectedFiles,
              details: details,
              aspectRatio: details.aspectRatio);
        },
      ),
    );
  }

  
}
