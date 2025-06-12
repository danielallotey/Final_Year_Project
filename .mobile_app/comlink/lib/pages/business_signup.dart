import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './personal_info.dart';
import 'package:adobe_xd/page_link.dart';
import './regular_top_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessSignup extends StatelessWidget {
  BusinessSignup({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            color: const Color(0xfff9f7f6),
          ),
          Pinned.fromPins(
            Pin(start: 31.0, end: 55.0),
            Pin(size: 107.0, start: 114.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 27,
                  color: const Color(0xff000000),
                  letterSpacing: 1.08,
                  height: 1.2962962962962963,
                ),
                children: [
                  TextSpan(
                    text: 'Find ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'customers\n',
                    style: TextStyle(
                      color: const Color(0xff3583bd),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'looking ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'to hire',
                    style: TextStyle(
                      color: const Color(0xff3583bd),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' and\ngrow your business',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
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
            Pin(start: 31.0, end: 31.0),
            Pin(size: 45.0, middle: 0.5111),
            child:
                // Adobe XD layer: 'Search Button' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.easeInOutExpo,
                  duration: 1.0,
                  pageBuilder: () => PersonalInfo(),
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
                      width: 102.0,
                      height: 23.0,
                      child: Text(
                        'Get Started',
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
            Pin(start: 31.0, end: 31.0),
            Pin(size: 45.0, middle: 0.4263),
            child:
                // Adobe XD layer: 'Service Needed Input' (group)
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
                    'Service Provided',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: const Color(0xffb8aaaa),
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
                  Pin(size: 9.2, end: 25.8),
                  Pin(size: 18.0, middle: 0.5185),
                  child:
                      // Adobe XD layer: 'ic_unfold_more_24px' (shape)
                      SvgPicture.string(
                    _svg_p9a8nd,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 266.0, start: 32.0),
            Pin(size: 23.0, middle: 0.2966),
            child:
                // Adobe XD layer: 'Tagline' (group)
                Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(17.0, 0.0, 0.0, 0.0),
                  child: SizedBox.expand(
                      child: Text(
                    'What service do you provide?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: const Color(0xff000000),
                      letterSpacing: 0.32,
                      fontWeight: FontWeight.w600,
                      height: 1.25,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                      color: const Color(0xfff64743),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    ),
                  ),
                ),
              ],
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

const String _svg_p9a8nd =
    '<svg viewBox="298.0 438.0 9.2 18.0" ><path transform="translate(290.59, 435.0)" d="M 12 5.829999923706055 L 15.17000007629395 9 L 16.57999992370605 7.590000152587891 L 12 3 L 7.409999847412109 7.590000152587891 L 8.829999923706055 9 L 12 5.829999923706055 Z M 12 18.17000007629395 L 8.829999923706055 15 L 7.420000076293945 16.40999984741211 L 12 21 L 16.59000015258789 16.40999984741211 L 15.17000007629395 15 L 12 18.17000007629395 Z" fill="#95989a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
