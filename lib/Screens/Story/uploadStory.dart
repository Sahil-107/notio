import 'package:flutter/material.dart';
import 'package:notio/Screens/Story/storyObject.dart';

import 'package:notio/utility.dart';
import 'package:story_view/story_view.dart';
import 'package:image_picker/image_picker.dart';

// class UploadStory extends StatefulWidget {
//   @override
//   State<UploadStory> createState() => _UploadStoryState();
// }

// class _UploadStoryState extends State<UploadStory> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 0,
//         backgroundColor: Colors.black, // Status bar color
//       ),
//       backgroundColor: Color(0xff222222),
//       body: Column(
//         children: [Text("Upload story")],
//       ),
//     );
//   }
// }

late final XFile? photo;
final ImagePicker _picker = ImagePicker();

Future<dynamic> UploadStory(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Form(
            // key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    photo = await _picker.pickImage(
                        imageQuality: 1, source: ImageSource.camera);
                    if (photo != null) {
                      // Fluttertoast.showToast(msg: "Image Uploaded!");
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            // color: orange_color,
                            size: getheight(context, 40),
                          )),
                      Text(
                        "Camera",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: getwidth(context, 20),
                ),
                GestureDetector(
                    onTap: () async {
                      Navigator.pop(context);
                      photo = await _picker.pickImage(
                          imageQuality: 45, source: ImageSource.gallery);
                      if (photo != null) {
                        // Fluttertoast.showToast(
                        //     msg: "Image Uploaded!");
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.folder_open_outlined,
                            // color: orange_color,
                            size: getheight(context, 40),
                          ),
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ],
            ),
          ),
        );
      });
}
