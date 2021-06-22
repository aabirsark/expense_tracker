import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensePage extends StatelessWidget {
  final String title;
  final Color color;
  const ExpensePage({Key key, @required this.title, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5956ea),
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(title),
        centerTitle: true,
      ),
      body: MainBody(color: color),
    );
  }
}

class MainBody extends StatelessWidget {
  final Color color;

  const MainBody({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [GraphContainer(), SheetDrawer(color: color)],
    );
  }
}

class SheetDrawer extends StatelessWidget {
  final Color color;

  const SheetDrawer({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.55,
        minChildSize: 0.55,
        maxChildSize: 0.95,
        builder: (ctx, scrollController) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              // child: Column(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.all(10.0),
              //       child: Text("------"),
              //     ),
              child: DraggableColumnXContainer(
                color: color,
                scrollController: scrollController,
              )
              // ],
              // ),
              );
        });
  }
}

class DraggableColumnXContainer extends StatelessWidget {
  final Color color;

  final ScrollController scrollController;

  const DraggableColumnXContainer({
    Key key,
    this.scrollController,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopPaddingScrollableListView(),
        SizedBox(
          height: 10,
        ),
        HistoryTag(),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: MainScrollBody(
            color: color,
            scrollController: scrollController,
          ),
        ),
      ],
    );
  }
}

class MainScrollBody extends StatelessWidget {
  final Color color;

  final ScrollController scrollController;
  const MainScrollBody({
    Key key,
    this.scrollController,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          controller: scrollController,
          itemCount: 10000000000000000,
          separatorBuilder: (context, int) {
            return Container(
              padding: const EdgeInsets.only(left: 70, right: 10),
              child: Divider(
                color: Colors.grey[600],
              ),
            );
          },
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: ListTileAvatar(),
              trailing: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: color.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: MyTtitle(
                    str: "\$10",
                  )),
              title: ListTileTitle(),
            );
          }),
    );
  }
}

class ListTileAvatar extends StatelessWidget {
  const ListTileAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFF5956ea).withOpacity(0.8),
      child: Icon(
        CupertinoIcons.folder_open,
        color: Colors.white,
      ),
    );
  }
}

class ListTileTitle extends StatelessWidget {
  const ListTileTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Buying Tomatoes, Potatoes etc ",
      style: TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.height * 0.02,
          fontFamily: GoogleFonts.aBeeZee().fontFamily,
          fontWeight: FontWeight.bold),
    );
  }
}

class HistoryTag extends StatelessWidget {
  const HistoryTag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Recent Highlights",
            style: TextStyle(
                fontSize: 20,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.lato().fontFamily),
          ),
          TodayCount()
        ],
      ),
    );
  }
}

class TodayCount extends StatelessWidget {
  const TodayCount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Color(0xFF5956ea).withOpacity(0.7),
          borderRadius: BorderRadius.circular(10)),
      child: MyTtitle(
        str: "2 New Today",
      ),
    );
  }
}

class MyTtitle extends StatelessWidget {
  final String str;
  const MyTtitle({
    Key key,
    this.str,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.width * 0.03),
    );
  }
}

class TopPaddingScrollableListView extends StatelessWidget {
  const TopPaddingScrollableListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 60,
          child: Divider(
            color: Colors.grey,
          )),
    );
  }
}

class GraphContainer extends StatelessWidget {
  const GraphContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Graphs(ourColor: Colors.white),
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
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
              showTitles: true,
              // reservedSize: 22,
              // margin: 10,
              getTextStyles: (value) => const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
              getTitles: (values) {
                switch (values.toInt()) {
                  case 0:
                    return 'Mon';
                  case 1:
                    return 'Tue';
                  case 2:
                    return 'Wed';
                  case 3:
                    return 'Thru';
                  case 4:
                    return 'Fri';
                  case 5:
                    return 'Sat';
                  case 6:
                    return 'Sun';
                }
                return '';
              }),
          leftTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '200';

                case 2:
                  return '400';

                case 3:
                  return '800';

                case 4:
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
        maxX: 7,
        maxY: 4,
        minY: 0,
        lineBarsData: [Utils.chartData(ourColor)],
      )),
    );
  }
}

class Utils {
  static LineChartBarData chartData(color) => LineChartBarData(
        spots: [
          FlSpot(0, 1),
          FlSpot(2, 2.8),
          FlSpot(3, 3.3),
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
