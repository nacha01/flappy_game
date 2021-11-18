import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool change = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: AnimatedContainer(
            duration: Duration(milliseconds: 2500),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: change == false
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    end: change == false
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    stops: [
                  0,
                  change == false ? 0.4 : 0.6,
                  1
                ],
                    colors: [
                  Color(0xffFFCC70),
                  Color(0xffC850C0),
                  Color(0xff4158D0),
                ])),
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.14,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(

                          height: MediaQuery.of(context).size.height*0.2,
                          width: MediaQuery.of(context).size.width*0.75,
                          child: Card(
                            margin: EdgeInsets.all(0),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 10,
                            child: Center(
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  WavyAnimatedText("Memory Game",
                                      speed: Duration(milliseconds: 450),
                                      textStyle: TextStyle(
                                        fontSize: 29,
                                        fontFamily: "Source",
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffDD2A7B),
                                      )),
                                ],
                                repeatForever: true,
                                isRepeatingAnimation: true,
                              ),
                            ),
                          ),
                        ),
                      ]))
            ])));
  }
}
