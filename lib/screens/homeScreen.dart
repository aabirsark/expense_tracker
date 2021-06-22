import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffFFA62E), Color(0xFFEA4D2C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: HomePageRoot(),
          ),
        ),
      ),
    );
  }
}

class HomePageRoot extends StatelessWidget {
  const HomePageRoot({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        Text(
          "Welcome Back",
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        SizedBox(height: 10),
        Text("Aabir Sarkar",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35)),
        SizedBox(
          height: 30,
        ),
        InfoCard(
          title: "Earnings",
          ourColor: Colors.green,
        ),
        SizedBox(
          height: 20,
        ),
        InfoCard(
          title: "Expenses",
          ourColor: Colors.red,
        ),
        SizedBox(
          height: 20,
        ),
        InfoCard(
          title: "Savings",
          ourColor: Colors.blue,
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final Color ourColor;
  final String title;
  const InfoCard({
    Key key,
    @required this.ourColor,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5.copyWith(
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: FontWeight.bold,
                color: ourColor),
          ),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          Graphs(ourColor: ourColor),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: Center(
              child: TodayData(ourColor: ourColor),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(color: Colors.grey),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RowTextStyling(
                ourColor: ourColor,
                title: title,
                value: '₹ 6,000',
                typeM: "Week's ",
              ),
              RowTextStyling(
                ourColor: ourColor,
                title: title,
                value: '₹ 30,000',
                typeM: "Months's ",
              )
            ],
          )
        ],
      ),
    );
  }
}

class TodayData extends StatelessWidget {
  const TodayData({
    Key key,
    @required this.ourColor,
  }) : super(key: key);

  final Color ourColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("₹ 950 ",
            style: TextStyle(
                color: ourColor,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 30)),
        Text("Today",
            style: TextStyle(
                color: Colors.grey,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 12))
      ],
    );
  }
}

class RowTextStyling extends StatelessWidget {
  const RowTextStyling({
    Key key,
    @required this.ourColor,
    @required this.title,
    @required this.value,
    @required this.typeM,
  }) : super(key: key);

  final Color ourColor;
  final String title;
  final String value;
  final String typeM;

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: "$value \n",
              style: TextStyle(
                  color: ourColor,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          TextSpan(
              text: "$typeM\n$title",
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 12))
        ]));
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
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
              showTitles: true,
              // reservedSize: 22,
              // margin: 10,
              getTextStyles: (value) => const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
              getTitles: (values) {
                switch (values.toInt()) {
                  case 10:
                    return '10';
                  case 20:
                    return '20';
                  case 30:
                    return '30';
                }
                return '';
              }),
          leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff75729e),
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '200';

                case 3:
                  return '400';

                case 5:
                  return '800';

                case 7:
                  return '1000';
              }
              return '';
            },
            margin: 8,
            reservedSize: 30,
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
        maxX: 35,
        maxY: 7,
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
          FlSpot(2, 2.8),
          FlSpot(3, 6.3),
          FlSpot(4, 5.2),
          FlSpot(5, 7),
          FlSpot(6, 5.4),
          FlSpot(7, 3.3),
          FlSpot(8, 2.2),
          FlSpot(9, 4.3),
          FlSpot(10, 3.2),
          FlSpot(11, 5.2),
          FlSpot(12, 3.2),
          FlSpot(13, 6.2),
          FlSpot(14, 5.2),
          FlSpot(15, 2.2),
          FlSpot(16, 3.0),
          FlSpot(17, 3.5),
          FlSpot(18, 4.2),
          FlSpot(19, 4.3),
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
        belowBarData: BarAreaData(show: true, colors: [
          color.withOpacity(0.1),
        ]),
      );
}
