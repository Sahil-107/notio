import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../widgets.dart';

class CreatorProfile extends StatefulWidget {
  @override
  State<CreatorProfile> createState() => _CreatorProfileState();
}

class _CreatorProfileState extends State<CreatorProfile> {
  bool _isliked_notes = false;
  bool _isbookmarked_notes = false;
  ScrollController _mycontroller1 = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SlidingUpPanel(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28), topRight: Radius.circular(28)),
          backdropEnabled: true,
          parallaxEnabled: true,
          parallaxOffset: .5,
          maxHeight: MediaQuery.of(context).size.height,
          minHeight: getheight(context, 300),
          panel: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getheight(context, 20)),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
                  child: Text(
                    "Contributions",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: getheight(context, 27),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
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
                          Notes(
                              isliked: _isliked_notes,
                              isbookmarked: _isbookmarked_notes),
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
                )
              ],
            ),
          ),
          body: Column(
            children: [
              SizedBox(height: getheight(context, 60)),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 40)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Profile",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700)),
                        // SizedBox(height: getheight(context, 10)),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications)
                  ],
                ),
              ),
              SizedBox(
                height: getheight(context, 40),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: getwidth(context, 30)),
                    padding: EdgeInsets.all(getwidth(context, 20)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 4,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: getheight(context, 84),
                              width: getheight(context, 84),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  border: Border.all(color: Colors.lightBlue)),
                            ),
                            SizedBox(width: getwidth(context, 24)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("@joveian"),
                                Text(
                                  "Jovi Daniel",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    width: getwidth(context, 170),
                                    child: Text(
                                        "University Institute of Technology"))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: getheight(context, 20),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About me",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: getheight(context, 8),
                            ),
                            Text(
                                "Madison Blackstone is a director of user experience design, with experience managing global teams."),
                            SizedBox(
                              height: getheight(context, 50),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: getheight(context, 250),
                    right: 0.0,
                    left: 0.0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.lightBlue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 12,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text("52",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text("Contribution",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            children: [
                              Text("250",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text("   Following   ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            children: [
                              Text("4.5K",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text("     Likes     ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
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
          width: getwidth(context, 295),
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
                  "VLSI hadnwritten notes",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.blue),
                ),
                SizedBox(
                  height: 4,
                ),
                Text("by Rahul"),
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
