import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:notio/widgets.dart';

class NoteModule extends StatefulWidget {
  const NoteModule({Key? key}) : super(key: key);

  @override
  State<NoteModule> createState() => _NoteModuleState();
}

class _NoteModuleState extends State<NoteModule> {
  @override
  void initState() {
    secure();
    super.initState();
  }

  Future<void> secure() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void dispose() {
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: getheight(context, 700),
        child: PDF(
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: false,
          onError: (error) {
            print(error.toString());
          },
          onPageError: (page, error) {
            print('$page: ${error.toString()}');
          },
        ).cachedFromUrl(
            'https://firebasestorage.googleapis.com/v0/b/stackx-24edc.appspot.com/o/4425984?alt=media&token=2a845cd0-aae6-4ee5-b08b-6a7ddb2c6ef1'),
      ),
    );
  }
}
