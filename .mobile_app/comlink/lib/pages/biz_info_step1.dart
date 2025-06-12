import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './step2.dart';
import 'package:adobe_xd/page_link.dart';
import '../components/back_top_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BizInfoStep1 extends StatelessWidget {
  const BizInfoStep1({
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
            Pin(size: 415.0, end: 82.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(9.0),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.146),
            child: SizedBox(
              width: 203.0,
              height: 25.0,
              child: Text(
                'Join Our Marketplace',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: const Color(0xff3583bd),
                  letterSpacing: 0.36,
                  fontWeight: FontWeight.w600,
                  height: 1.1111111111111112,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 37.0, end: 36.0),
            Pin(size: 45.0, middle: 0.5945),
            child:
                // Adobe XD layer: 'Type of Business' (group)
                Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(7.0),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 148.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Type of Business',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: const Color(0xff000000),
                      letterSpacing: 1.12,
                      height: 1.25,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 14.3, end: 19.7),
                  Pin(size: 7.2, middle: 0.5021),
                  child:
                      // Adobe XD layer: 'ic_arrow_drop_down_…' (shape)
                      SvgPicture.string(
                    _svg_ao569x,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 37.0, end: 36.0),
            Pin(size: 45.0, middle: 0.5098),
            child:
                // Adobe XD layer: 'Name of Business' (group)
                Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(7.0),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 158.0, start: 15.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Name of Business',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: const Color(0xff000000),
                      letterSpacing: 1.12,
                      height: 1.25,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 37.0, end: 36.0),
            Pin(size: 45.0, middle: 0.8227),
            child:
                // Adobe XD layer: 'Next button' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.easeInOutExpo,
                  duration: 1.0,
                  pageBuilder: () => Step2(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff64743),
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 38.0,
                      height: 23.0,
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: const Color(0xffffffff),
                          letterSpacing: 1.12,
                          height: 1.25,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 183.0, start: 39.0),
            Pin(size: 16.0, end: 102.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 11,
                  color: const Color(0xff000000),
                  letterSpacing: 0.11,
                  height: 1.8181818181818181,
                ),
                children: [
                  TextSpan(
                    text: 'Already have an account? ',
                  ),
                  TextSpan(
                    text: 'Log in',
                    style: TextStyle(
                      color: const Color(0xff006ea2),
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 44.0, end: 38.0),
            Pin(size: 16.0, end: 102.0),
            child: Text(
              'Step 1/2',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 11,
                color: const Color(0xff000000),
                letterSpacing: 0.11,
                height: 1.8181818181818181,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 37.0, end: 36.0),
            Pin(size: 45.0, middle: 0.6793),
            child:
                // Adobe XD layer: 'Category' (group)
                Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(7.0),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 83.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Category',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: const Color(0xff000000),
                      letterSpacing: 1.12,
                      height: 1.25,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 14.3, end: 19.7),
                  Pin(size: 7.2, middle: 0.5021),
                  child:
                      // Adobe XD layer: 'ic_arrow_drop_down_…' (shape)
                      SvgPicture.string(
                    _svg_ao569x,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
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

// ignore: constant_identifier_names
const String _svg_ao569x =
    '<svg viewBox="288.0 443.0 14.3 7.2" ><path transform="translate(281.0, 433.0)" d="M 7 10 L 14.15801906585693 17.15802192687988 L 21.3160400390625 10 L 7 10 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
