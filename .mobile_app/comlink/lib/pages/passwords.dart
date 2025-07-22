import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import '../components/back_top_bar.dart';

class Passwords extends StatelessWidget {
  const Passwords({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: 'background image' (shape)
          Container(
            color: const Color(0xffffffff),
          ),
          Pinned.fromPins(
            Pin(size: 105.0, middle: 0.5),
            Pin(size: 40.0, end: 50.0),
            child:
                // Adobe XD layer: 'Save' (group)
                Stack(
              children: [
// background:
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff3583bd),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 8.0, 29.0, 7.0),
                    child: Stack(
                      children: <Widget>[
                        SizedBox.expand(
                            child:
                                // Adobe XD layer: 'Save' (text)
                                Text(
                          'Save',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: const Color(0xffffffff),
                            letterSpacing: 0.36,
                            fontWeight: FontWeight.w500,
                            height: 1.6666666666666667,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 37.0, end: 36.0),
            Pin(size: 126.0, start: 105.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 53.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'Phone' (group)
                      Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff707070)),
                        ),
                        margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                      ),
                      Pinned.fromPins(
                        Pin(size: 95.0, start: 20.0),
                        Pin(size: 20.0, middle: 0.6364),
                        child:
                            // Adobe XD layer: '+233 50 366 5910' (text)
                            Text(
                          '************',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: const Color(0xff000000),
                            letterSpacing: 0.9800000000000001,
                            fontWeight: FontWeight.w500,
                            height: 1.4285714285714286,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 142.0, start: 17.0),
                        Pin(size: 17.0, start: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: const Color(0xffffffff),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5.0, 0.0, 7.0, 0.0),
                              child: SizedBox.expand(
                                  child:
                                      // Adobe XD layer: 'Phone' (text)
                                      Text(
                                'Confirm Passwords',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: const Color(0xff000000),
                                  letterSpacing: 0.8400000000000001,
                                  fontWeight: FontWeight.w500,
                                  height: 1.6666666666666667,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 53.0, start: 0.0),
                  child:
                      // Adobe XD layer: 'Full Name' (group)
                      Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff707070)),
                        ),
                        margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                      ),
                      Pinned.fromPins(
                        Pin(size: 95.0, start: 20.0),
                        Pin(size: 20.0, middle: 0.6364),
                        child: Text(
                          '************',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: const Color(0xff000000),
                            letterSpacing: 0.9800000000000001,
                            fontWeight: FontWeight.w500,
                            height: 1.4285714285714286,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 81.0, start: 17.0),
                        Pin(size: 17.0, start: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: const Color(0xffffffff),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(4.0, 0.0, 5.0, 0.0),
                              child: SizedBox.expand(
                                  child:
                                      // Adobe XD layer: 'Username' (text)
                                      Text(
                                'Passwords',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: const Color(0xff000000),
                                  letterSpacing: 0.8400000000000001,
                                  fontWeight: FontWeight.w500,
                                  height: 1.6666666666666667,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 65.0, start: 0.0),
            child:
                // Adobe XD layer: 'Back Top Bar' (component)
                BackTopBar(),
          ),
        ],
      ),
    );
  }
}
