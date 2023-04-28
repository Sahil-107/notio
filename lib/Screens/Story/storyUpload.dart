import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:notio/apiServices/storyModuleServices.dart';
import 'package:notio/main.dart';
import 'package:notio/utility.dart';
import 'package:video_player/video_player.dart';

class DisplayImages extends StatefulWidget {
  final List<SelectedByte> selectedBytes;
  final double aspectRatio;
  final SelectedImagesDetails details;
  const DisplayImages({
    Key? key,
    required this.details,
    required this.selectedBytes,
    required this.aspectRatio,
  }) : super(key: key);

  @override
  State<DisplayImages> createState() => _DisplayImagesState();
}

class _DisplayImagesState extends State<DisplayImages> {
  @override
  void initState() {
    print(widget.selectedBytes.first.selectedFile);
    super.initState();
  }

  String _caption = "";
  String _type = "image";

  storyServices _ss = new storyServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.blue, // Status bar color
        ),
        body: widget.selectedBytes[0].isThatImage
            ? Column(
                children: [
                  SizedBox(
                    height: getheight(context, 20),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.2)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("images/sem1.png"),
                          height: 35,
                        ),
                        SizedBox(
                          width: getwidth(context, 5),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentUser.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              currentUser.branch,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Center(
                      child: Container(
                    height: getheight(context, 400),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        image: DecorationImage(
                            image:
                                FileImage(widget.selectedBytes[0].selectedFile),
                            fit: BoxFit.fitWidth)),
                  )),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.2)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            onChanged: (value) {
                              _caption = value;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type caption here!",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              var response = await _ss.uploadStory(
                                  widget.selectedBytes[0].selectedFile, {
                                "id": currentUser.id,
                                "caption": _caption,
                                "type": widget.selectedBytes[0].isThatImage?"image":"video"
                              });
                              if (response.statusCode == 200) {
                                // Handle the successful response
                                final responseString =
                                    await response.stream.bytesToString();
                                print(jsonDecode(responseString)["Response"]);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              } else {
                                // Handle the error response
                                print('Error: ${response.statusCode}');
                              }
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getheight(context, 30),
                  ),
                ],
              )
            : _DisplayVideo(selectedByte: widget.selectedBytes[0]));
  }
}

class _DisplayVideo extends StatefulWidget {
  final SelectedByte selectedByte;
  const _DisplayVideo({Key? key, required this.selectedByte}) : super(key: key);

  @override
  State<_DisplayVideo> createState() => _DisplayVideoState();
}

class _DisplayVideoState extends State<_DisplayVideo> {
  late VideoPlayerController controller;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    File file = widget.selectedByte.selectedFile;
    controller = VideoPlayerController.file(file);
    initializeVideoPlayerFuture = controller.initialize();
    controller.setLooping(true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                    });
                  },
                  child: Icon(
                    controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              )
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 1),
          );
        }
      },
    );
  }
}
