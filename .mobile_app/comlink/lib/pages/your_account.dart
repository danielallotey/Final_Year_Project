import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './personal_details.dart';
import 'package:adobe_xd/page_link.dart';
import './business_details.dart';
import './contacts_details.dart';
import './passwords.dart';
import '../pages/home_screen.dart';
import '../components/back_top_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YourAccount extends StatelessWidget {
  const YourAccount({
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
            color: const Color(0xff3583bd),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.fromLTRB(20.0, 93.0, 19.0, 21.0),
          ),
          Pinned.fromPins(
            Pin(start: 20.5, end: 18.5),
            Pin(size: 330.0, start: 110.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 40.0, start: 0.0),
                  child: PageLink(
                    links: [
                      PageLinkInfo(
                        ease: Curves.easeInOutExpo,
                        duration: 1.0,
                        pageBuilder: () => PersonalDetails(),
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 150.0, start: 19.5),
                          Pin(size: 25.0, start: 0.0),
                          child:
                              // Adobe XD layer: 'Overview' (text)
                              Text(
                            'Personal Details',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: const Color(0xff000000),
                              letterSpacing: 0.36,
                              fontWeight: FontWeight.w500,
                              height: 1.6666666666666667,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 1.0, end: -1.0),
                          child: SvgPicture.string(
                            _svg_r9zk9d,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 40.0, middle: 0.2),
                  child: PageLink(
                    links: [
                      PageLinkInfo(
                        ease: Curves.easeInOutExpo,
                        duration: 1.0,
                        pageBuilder: () => BusinessDetails(),
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 151.0, start: 19.5),
                          Pin(size: 25.0, start: 0.0),
                          child:
                              // Adobe XD layer: 'Overview' (text)
                              Text(
                            'Business Details',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: const Color(0xff000000),
                              letterSpacing: 0.36,
                              fontWeight: FontWeight.w500,
                              height: 1.6666666666666667,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 1.0, end: -1.0),
                          child: SvgPicture.string(
                            _svg_r9zk9d,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 40.0, middle: 0.4),
                  child: PageLink(
                    links: [
                      PageLinkInfo(
                        ease: Curves.easeInOutExpo,
                        duration: 1.0,
                        pageBuilder: () => ContactsDetails(),
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 145.0, start: 19.5),
                          Pin(size: 25.0, start: 0.0),
                          child:
                              // Adobe XD layer: 'Overview' (text)
                              Text(
                            'Contact Details',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: const Color(0xff000000),
                              letterSpacing: 0.36,
                              fontWeight: FontWeight.w500,
                              height: 1.6666666666666667,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 1.0, end: -1.0),
                          child: SvgPicture.string(
                            _svg_r9zk9d,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 40.0, middle: 0.6),
                  child: PageLink(
                    links: [
                      PageLinkInfo(
                        ease: Curves.easeInOutExpo,
                        duration: 1.0,
                        pageBuilder: () => Passwords(),
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 100.0, start: 19.5),
                          Pin(size: 25.0, start: 0.0),
                          child:
                              // Adobe XD layer: 'Overview' (text)
                              Text(
                            'Passwords',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: const Color(0xff000000),
                              letterSpacing: 0.36,
                              fontWeight: FontWeight.w500,
                              height: 1.6666666666666667,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 1.0, end: -1.0),
                          child: SvgPicture.string(
                            _svg_r9zk9d,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 1.0, end: -1.0),
                          child: SvgPicture.string(
                            _svg_r9zk9d,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 40.0, middle: 0.8),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 143.0, start: 19.5),
                        Pin(size: 25.0, start: 0.0),
                        child:
                            // Adobe XD layer: 'Overview' (text)
                            Text(
                          'Delete Account',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: const Color(0xff000000),
                            letterSpacing: 0.36,
                            fontWeight: FontWeight.w500,
                            height: 1.6666666666666667,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 1.0, end: -1.0),
                        child: SvgPicture.string(
                          _svg_r9zk9d,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 1.0, end: -1.0),
                        child: SvgPicture.string(
                          _svg_r9zk9d,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 40.0, end: 0.0),
                  child: PageLink(
                    links: [
                      PageLinkInfo(
                        ease: Curves.easeInOutExpo,
                        duration: 1.0,
                        pageBuilder: () => HomeScreen(),
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 71.0, start: 19.5),
                          Pin(size: 25.0, start: 0.0),
                          child:
                              // Adobe XD layer: 'Overview' (text)
                              Text(
                            'Log Out',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: const Color(0xff000000),
                              letterSpacing: 0.36,
                              fontWeight: FontWeight.w500,
                              height: 1.6666666666666667,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 1.0, end: -1.0),
                          child: SvgPicture.string(
                            _svg_r9zk9d,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 1.0, end: -1.0),
                          child: SvgPicture.string(
                            _svg_r9zk9d,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
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
                // Adobe XD layer: 'Back Top Bar' (component)
                BackTopBar(),
          ),
        ],
      ),
    );
  }
}

// ignore: constant_identifier_names
const String _svg_r9zk9d =
    '<svg viewBox="20.5 149.0 336.0 1.0" ><path transform="translate(20.5, 149.0)" d="M 0 0 L 336 0" fill="none" stroke="#bbb6b6" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
