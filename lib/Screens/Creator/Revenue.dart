import 'package:flutter/material.dart';
import '../../widgets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Revenue extends StatefulWidget {
  @override
  State<Revenue> createState() => _RevenueState();
}

class _RevenueState extends State<Revenue> {
  DateTime now = DateTime.now();

  String _displayMonth = DateFormat.MMMM().format(DateTime.now());
  String _displayYear = DateTime.now().year.toString();

  int orders = 0;

  double revenue = 0;

  @override
  Widget build(BuildContext context) {
    List<ChartData> data = [
      ChartData(2010, 35),
      ChartData(2011, 28),
      ChartData(2012, 34),
      ChartData(2013, 32),
      ChartData(2014, 40),
      ChartData(2015, 35),
      ChartData(2016, 28),
      ChartData(2017, 34),
      ChartData(2018, 32),
      ChartData(2019, 40)
    ];
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: getheight(context, 60)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 20)),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.keyboard_arrow_left)),
                    SizedBox(
                      width: getwidth(context, 30),
                    ),
                    Text(
                      "Revenue",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: getheight(context, 35),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getwidth(context, 40)),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: now.subtract(Duration(days: 3650 * 2)),
                      lastDate: now.add(Duration(days: 3650 * 2)),
                    ).then((value) {
                      setState(() {
                        DateTime? now = value;
                        _displayYear = value!.year.toString();
                        _displayMonth = DateFormat.MMMM().format(value);
                        // get_revenue_details();
                      });
                    });
                  },
                  child: Text("${_displayMonth} ${_displayYear}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      /// going to previous date
                      setState(() {
                        now = now.subtract(Duration(days: 30));
                        _displayMonth = DateFormat.MMMM().format(now);
                        // get_revenue_details();
                      });
                    },
                    child: Icon(Icons.keyboard_arrow_left)),
                SizedBox(width: 10),
                GestureDetector(
                    onTap: () {
                      //////// going to forward date
                      setState(() {
                        now = now.add(Duration(days: 30));
                        _displayMonth = DateFormat.MMMM().format(now);
                        // get_revenue_details();
                      });
                    },
                    child: Icon(Icons.keyboard_arrow_right))
              ],
            ),
          ),
          SizedBox(height: getheight(context, 30)),
          Container(
            height: getheight(context, 300),
            child: SfCartesianChart(
                crosshairBehavior: CrosshairBehavior(
                    shouldAlwaysShow: true,
                    enable: false,
                    activationMode: ActivationMode.singleTap),
                series: <ChartSeries>[
                  LineSeries<ChartData, int>(
                      dataSource: data,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      name: 'Sales',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
          ),
          SizedBox(
            height: getheight(context, 40),
          ),
          Container(
            // height: getheight(context, 90),
            width: getwidth(context, 315),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.01),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Your revenue",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    "${revenue.toString()}/-",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getheight(context, 20),
          ),
          Container(
            // height: getheight(context, 90),
            width: getwidth(context, 315),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.01),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Total sale",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    "$orders",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getheight(context, 20),
          ),
        ]),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
