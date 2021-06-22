import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:expense_tracker/screens/onbording.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      child: TabBar(
                        unselectedLabelColor: Color(0xFF5956ea),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                            color: Color(0xFF5956ea),
                            borderRadius: BorderRadius.circular(50)),
                        tabs: [
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: Color(0xFF5956ea), width: 1),
                              ),
                              child: Center(
                                child: Text("Earning"),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: Color(0xFF5956ea), width: 1),
                              ),
                              child: Center(
                                child: Text("Expense"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    TabBarView(children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WelcomeTextField(),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Type",
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Wrap(
                                runAlignment: WrapAlignment.spaceAround,
                                alignment: WrapAlignment.spaceAround,
                                runSpacing: 20,
                                spacing: 10,
                                children: [
                                  PrettyWidgets(
                                    color: Colors.blue,
                                    icon: Icon(
                                      FontAwesomeIcons.stamp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PrettyWidgets(
                                    color: Colors.blue,
                                    icon: Icon(
                                      FontAwesomeIcons.stamp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PrettyWidgets(
                                    color: Colors.blue,
                                    icon: Icon(
                                      FontAwesomeIcons.stamp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PrettyWidgets(
                                    color: Colors.blue,
                                    icon: Icon(
                                      FontAwesomeIcons.stamp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PrettyWidgets(
                                    color: Colors.blue,
                                    icon: Icon(
                                      FontAwesomeIcons.stamp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PrettyWidgets(
                                    color: Colors.blue,
                                    icon: Icon(
                                      FontAwesomeIcons.stamp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PrettyWidgets(
                                    color: Colors.blue,
                                    icon: Icon(
                                      FontAwesomeIcons.stamp,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Text("hello"),
                      )
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
/*
Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: TabBar(
            unselectedLabelColor: Color(0xFF5956ea),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                color: Color(0xFF5956ea),
                borderRadius: BorderRadius.circular(50)),
            tabs: [
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Color(0xFF5956ea), width: 1),
                  ),
                  child: Center(
                    child: Text("Earning"),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Color(0xFF5956ea), width: 1),
                  ),
                  child: Center(
                    child: Text("Expense"),
                  ),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          Center(
            child: Text("nothing"),
          ),
          Center(
            child: Text("hello"),
          )
        ]),
      ),
*/

class WelcomeTextField extends StatelessWidget {
  const WelcomeTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFF5956ea)),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        cursorColor: Color(0xFF5956ea),
        style: TextStyle(color: Colors.black, height: 1.2, fontSize: 22),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Source",
            fillColor: Color(0xFF5956ea).withOpacity(0.4),
            hintStyle: TextStyle(
                color: Color(0xFF5956ea).withOpacity(0.4),
                height: 1.2,
                fontSize: 22)),
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
      ),
    );
  }
}
