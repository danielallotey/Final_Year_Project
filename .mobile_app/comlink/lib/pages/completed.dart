import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import '../components/regular_top_bar.dart';

class Completed extends StatelessWidget {
  const Completed({
    super.key
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            color: const Color(0xff3583bd),
          ),
          Pinned.fromPins(
            Pin(start: 44.0, end: 43.0),
            Pin(size: 107.0, start: 114.0),
            child: Text(
              'ACCESS A LARGER\nNETWORK OF LOCAL\nCUSTOMERS',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 27,
                color: const Color(0xffffffff),
                letterSpacing: 1.08,
                fontWeight: FontWeight.w700,
                height: 1.2962962962962963,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 40.0, end: 38.0),
            Pin(size: 20.0, middle: 0.298),
            child: Text(
              'Local jobs to grow your business your way',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: const Color(0xffffffff),
                letterSpacing: 0.098,
                height: 1.4285714285714286,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(size: 392.0, end: 102.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(9.0),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 52.0, end: 51.0),
            Pin(size: 58.0, middle: 0.4854),
            child: Text(
              'You\'re on your way to new\ncustomers!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: const Color(0xff000000),
                letterSpacing: 0.4,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 47.0, end: 46.0),
            Pin(size: 102.0, middle: 0.6662),
            child: Text(
              'A rep will reach\nout to you soon!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 33,
                color: const Color(0xff3583bd),
                letterSpacing: 0.66,
                fontWeight: FontWeight.w700,
                height: 1.6666666666666667,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 65.0, start: 0.0),
            child:
                // Adobe XD layer: 'Regular Top Bar' (component)
                RegularTopBar(),
          ),
        ],
      ),
    );
  }
}
