import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/screens/add_screen.dart';
import 'package:expense_tracker/screens/expense.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.more_vert,
      //       color: Colors.grey,
      //     ),
      //     onPressed: () {},
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         CupertinoIcons.search,
      //         color: Colors.grey,
      //       ),
      //       onPressed: () {},
      //     ),
      //   ],
      //   elevation: 0.0,
      //   backgroundColor: Colors.transparent,
      // ),
      // bottomNavigationBar: BottomsUpNav(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: MainBody(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        MyAvatarHardCoded(),
        SizedBox(
          height: 20,
        ),
        Name(),
        HomeCard(),
        SizedBox(
          height: 18,
        ),
        OptionsList()
      ],
    );
  }
}

class OptionsList extends StatelessWidget {
  const OptionsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: double.infinity,
        child: Wrap(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          alignment: WrapAlignment.spaceAround,
          runAlignment: WrapAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => ExpensePage(
                            title: "Earnings", color: Colors.green)));
              },
              child: PrettyWidgets(
                color: Colors.white,
                icon: Icon(CupertinoIcons.folder, color: Color(0xFF5956ea)),
              ),
            ),
            InkWell(
              onTap: () {
                // showBottomSheet(
                //     context: context,
                //     elevation: 0.5,
                //     builder: (context) {
                //       return Container(
                //         height: MediaQuery.of(context).size.height * 0.85,
                //         width: double.infinity,
                //         color: Colors.white,
                //         child: Text("this is add modal"),
                //       );
                //     });
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => AddScreen()));
              },
              child: PrettyWidgets(
                color: Color(0xFF5956ea),
                icon: Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) =>
                            ExpensePage(title: "expense", color: Colors.red)));
              },
              child: PrettyWidgets(
                color: Colors.white,
                icon:
                    Icon(CupertinoIcons.money_dollar, color: Color(0xFF5956ea)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ! REMOVE THIS IN THE BUILD

// class OtherStyling extends StatelessWidget {
//   const OtherStyling({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       "Other Services",
//       style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontFamily: GoogleFonts.lato().fontFamily,
//           fontSize: MediaQuery.of(context).size.height * 0.03),
//       textAlign: TextAlign.start,
//     );
//   }
// }

class Name extends StatelessWidget {
  const Name({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Aabir Sarkar",
        style: TextStyle(
            fontSize: 30,
            fontFamily: GoogleFonts.roboto().fontFamily,
            color: Colors.blueGrey[900],
            wordSpacing: 2,
            letterSpacing: 2,
            fontWeight: FontWeight.bold));
  }
}

class MyAvatarHardCoded extends StatelessWidget {
  const MyAvatarHardCoded({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 70,
      width: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.asset(
        "assets/hello.jpg",
        fit: BoxFit.contain,
      ),
    );
  }
}

class PrettyWidgets extends StatelessWidget {
  final Icon icon;
  final Color color;
  const PrettyWidgets({
    Key key,
    this.icon,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Center(
        child: icon,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                color: Colors.black45.withOpacity(0.3), // black 45
                blurRadius: 53)
          ]),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 38.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.32,
        decoration: BoxDecoration(
            color: Color(0xFF5956ea),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  color: Color(0xFF5956ea).withOpacity(0.8),
                  blurRadius: 53)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.17,
                child: AspectRatio(
                    aspectRatio: 2.2, child: Graphs(ourColor: Colors.white)),
              ),
              Divider(color: Colors.white.withOpacity(0.3)),
              SizedBox(
                height: 10,
              ),
              Text(
                "Total Balance",
                style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.02),
              ),
              SizedBox(
                height: 5,
              ),
              Text("\$2564",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.03))
            ],
          ),
        ),
      ),
    );
  }
}

class Graphs extends StatelessWidget {
  const Graphs({
    Key key,
    @required this.ourColor,
  }) : super(key: key);

  final Color ourColor;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.0,
      child: LineChart(LineChartData(
        gridData: FlGridData(
          show: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: false,
            // reservedSize: 22,
            // margin: 10,
          ),
          leftTitles: SideTitles(
            showTitles: false,
            // margin: 8,
            // reservedSize: 30,
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Colors.transparent,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        minX: 0,
        maxX: 12,
        maxY: 5,
        minY: 0,
        lineBarsData: [Utils.chartData(ourColor)],
      )),
    );
  }
}

class Utils {
  static LineChartBarData chartData(color) => LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 2.5),
          FlSpot(4, 2.5),
          FlSpot(6, 1.2),
          FlSpot(7, 2.4),
          FlSpot(9, 3.4),

          // FlSpot(6, 3.4),
          // FlSpot(7, 2.3),
        ],
        isCurved: true,
        colors: [
          color,
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      );
}
