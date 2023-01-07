import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notio/Screens/NoteModule/stateController.dart';
import 'package:notio/utility.dart';

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
  dispose() {
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    super.dispose();
  }

  final notePageController _npc = Get.put(notePageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: _npc.bg,
          body: Column(
            children: [
              SizedBox(
                height: getheight(context, 70),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 26)),
                child: Row(
                  children: [
                    Text(
                      "VLSI Notes",
                      style: TextStyle(
                          color: blueColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    Switch(
                        value: _npc.darkMode,
                        onChanged: (val) {
                          _npc.trigger(val);
                        })
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: _npc.bg),
                height: MediaQuery.of(context).size.height * 0.8,
                child: PDF(
                  enableSwipe: true,
                  swipeHorizontal: true,
                  autoSpacing: false,
                  pageFling: false,
                  nightMode: _npc.darkMode,
                  onError: (error) {
                    print(error.toString());
                  },
                  onPageError: (page, error) {
                    print('$page: ${error.toString()}');
                  },
                ).cachedFromUrl(
                    'https://firebasestorage.googleapis.com/v0/b/stackx-24edc.appspot.com/o/1.VLSI%20DESIGN.pdf?alt=media&token=6b46c7d8-4f2e-4102-bd2b-14a05ceefffc'),
              ),
            ],
          ),
        ));
  }
}
