import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDataScreen extends StatelessWidget {
  const AddDataScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Add Data"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Color(0xFF5956ea),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Rs",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "50000",
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: MediaQuery.of(context).size.height * 0.07),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            NumBody()
          ],
        ),
      ),
    );
  }
}

class NumBody extends StatelessWidget {
  const NumBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.68,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Buttons("1", "2", "3", "l"),
              SizedBox(
                height: 20,
              ),
              Buttons("4", "5", "6", "l"),
              SizedBox(
                height: 20,
              ),
              Buttons("7", "8", "9", "l"),
              SizedBox(
                height: 20,
              ),
              Buttons(".", "0", "<", "l"),
            ],
          ),
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final e2;

  final e3;

  final type;

  Buttons(this.e1, this.e2, this.e3, this.type);

  final e1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButtonAddData(
          txt: e1,
        ),
        TextButtonAddData(
          txt: e2,
        ),
        TextButtonAddData(
          txt: e3,
        ),
      ],
    );
  }
}

class TextButtonAddData extends StatelessWidget {
  final String txt;
  const TextButtonAddData({
    Key key,
    @required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Text(
        txt,
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
