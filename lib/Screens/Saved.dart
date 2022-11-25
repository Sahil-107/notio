// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  bool _isliked_notes = false;
  bool _isbookmarked_notes = false;
  bool _isbookmarked_quepapers = false;

  ScrollController _mycontroller1 = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: getheight(context, 60)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saved",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                Spacer(),
                Icon(Icons.notifications)
              ],
            ),
          ),
          SizedBox(
            height: getheight(context, 36),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Saved notes",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    Text(
                      "more",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                SizedBox(
                  height: getheight(context, 27),
                ),
                Container(
                  height: getheight(context, 264),
                  child: SingleChildScrollView(
                    controller: _mycontroller1,
                    child: Column(
                      children: [
                        Notes(
                            isliked: _isliked_notes,
                            isbookmarked: _isbookmarked_notes),
                        Notes(
                            isliked: _isliked_notes,
                            isbookmarked: _isbookmarked_notes),
                        Notes(
                            isliked: _isliked_notes,
                            isbookmarked: _isbookmarked_notes),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getheight(context, 27),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "Saved question papers",
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          fontSize: getheight(context, 20),
                          fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    Text(
                      "more",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                SizedBox(
                  height: getheight(context, 14),
                ),
                Quepaper(isbookmarked_quepapers: _isbookmarked_quepapers),
                Quepaper(isbookmarked_quepapers: _isbookmarked_quepapers),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Quepaper extends StatefulWidget {
  Quepaper({
    Key? key,
    required bool isbookmarked_quepapers,
  })  : _isbookmarked_quepapers = isbookmarked_quepapers,
        super(key: key);

  bool _isbookmarked_quepapers;

  @override
  State<Quepaper> createState() => _QuepaperState();
}

class _QuepaperState extends State<Quepaper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getheight(context, 90),
          //width: getwidth(context, 295),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          child: Row(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: getheight(context, 117),
                  width: getwidth(context, 92),
                  child: Image(
                    image: AssetImage('images/chip.jpg'),
                    fit: BoxFit.fill,
                  ),
                )),
            SizedBox(
              width: getwidth(context, getwidth(context, 20)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getheight(context, getheight(context, 20)),
                ),
                Text(
                  "2018 VLSI Question Paper",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.blue),
                ),
                SizedBox(
                  height: getheight(context, 10),
                )
              ],
            )
          ]),
        ),
        SizedBox(
          height: getheight(context, 25),
        )
      ],
    );
  }
}

class Notes extends StatefulWidget {
  Notes({
    Key? key,
    required bool isliked,
    required bool isbookmarked,
  })  : _isliked = isliked,
        _isbookmarked = isbookmarked,
        super(key: key);

  bool _isliked;
  bool _isbookmarked;

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getheight(context, 117),
          //width: getwidth(context, 295),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          child: Row(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: getheight(context, 117),
                  width: getwidth(context, 117),
                  child: Image(
                    image: AssetImage('images/chip.jpg'),
                    fit: BoxFit.fill,
                  ),
                )),
            SizedBox(
              width: getwidth(context, getwidth(context, 20)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getheight(context, getheight(context, 20)),
                ),
                Text(
                  "VLSI hadnwritten notes",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.blue),
                ),
                SizedBox(
                  height: 4,
                ),
                Text("by Rashmi"),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          widget._isliked = !widget._isliked;
                        });
                      },
                      icon: Icon(
                        widget._isliked
                            ? Icons.thumb_up_alt_sharp
                            : Icons.thumb_up_outlined,
                        size: getheight(context, 25),
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "2.5k",
                    ),
                    SizedBox(
                      width: getwidth(context, 75),
                    ),
                    IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          widget._isbookmarked = !widget._isbookmarked;
                        });
                      },
                      icon: Icon(
                        widget._isbookmarked
                            ? Icons.bookmark_outline_sharp
                            : Icons.bookmark_sharp,
                        size: getheight(context, 25),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getheight(context, 10),
                )
              ],
            )
          ]),
        ),
        SizedBox(
          height: getheight(context, getheight(context, 25)),
        ),
      ],
    );
  }
}
