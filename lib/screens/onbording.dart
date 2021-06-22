import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [MainWelcomeScreen(), SubmitButtonForWelcomePage()],
      ),
    );
  }
}

class SubmitButtonForWelcomePage extends StatelessWidget {
  const SubmitButtonForWelcomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: MediaQuery.of(context).size.width * 0.2,
        right: 0,
        left: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: InkWell(
            child: WelcomeButtonContent(),
            onTap: () {},
          ),
        ));
  }
}

class WelcomeButtonContent extends StatelessWidget {
  const WelcomeButtonContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, "/home");
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xffFF9897), Color(0xFFF650A0)]),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 53,
                  color: Color(0xFFF650A0).withOpacity(0.3))
            ]),
        child: Center(
          child: Text(
            "Submit",
            style: TextStyle(
                color: Colors.white,
                height: 1.2,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class MainWelcomeScreen extends StatelessWidget {
  const MainWelcomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff6EE2F5), Color(0xFF6454F0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: WelcomeMainScreenColumn(),
    );
  }
}

class WelcomeMainScreenColumn extends StatelessWidget {
  const WelcomeMainScreenColumn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.2,
        ),
        Text(
          "Welcome",
          style: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.balooTammudu().fontFamily,
          ),
          textScaleFactor: 2.8,
        ),
        SizedBox(height: MediaQuery.of(context).size.width * 0.2),
        Text(
          "Enter Your First and Last Name",
          style: TextStyle(color: Color(0xffD6EAF8), height: 1.2, fontSize: 22),
        ),
        SizedBox(
          height: 40,
        ),
        WelcomeTextField()
      ],
    );
  }
}

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
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 0),
                blurRadius: 53,
                color: Colors.black38.withOpacity(0.2))
          ]),
      child: TextFormField(
        textAlign: TextAlign.center,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.white, height: 1.2, fontSize: 22),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "ex. Aabir Sarkar",
            fillColor: Colors.white,
            hintStyle:
                TextStyle(color: Color(0xffD6EAF8), height: 1.2, fontSize: 22)),
      ),
    );
  }
}
