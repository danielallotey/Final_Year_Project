import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import '../pages/login_page.dart';
import 'package:adobe_xd/page_link.dart';
import '../pages/business_signup.dart';
import '../pages/social_amenities.dart';
import '../pages/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RtbToggle extends StatelessWidget {
  const RtbToggle({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: const Color(0xffffffff),
        ),
        Pinned.fromPins(
          Pin(start: 20.0, end: 20.0),
          Pin(size: 280.0, start: 100.0),
          child:
              // Adobe XD layer: 'Menu items' (group)
              Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: 138.0,
                  height: 40.0,
                  child:
                      // Adobe XD layer: 'Sign In' (group)
                      PageLink(
                    links: [
                      PageLinkInfo(
                        ease: Curves.easeInOutExpo,
                        duration: 1.0,
                        pageBuilder: () => LoginPage(),
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Container(
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
                        Align(
                          alignment: Alignment(0.013, 0.067),
                          child: SizedBox(
                            width: 63.0,
                            height: 25.0,
                            child: Text(
                              'Sign In',
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Pinned.fromPins(
                Pin(start: 0.0, end: 0.0),
                Pin(size: 40.0, middle: 0.75),
                child:
                    // Adobe XD layer: 'Join Our Network' (group)
                    PageLink(
                  links: [
                    PageLinkInfo(
                      ease: Curves.easeInOutExpo,
                      duration: 1.0,
                      pageBuilder: () => BusinessSignup(),
                    ),
                  ],
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 190.0, start: 20.0),
                        Pin(size: 25.0, middle: 0.5333),
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(size: 160.0, end: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child: Text(
                                'Join Our Network',
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
                              Pin(size: 19.2, start: 0.0),
                              Pin(start: 3.0, end: 2.8),
                              child:
                                  // Adobe XD layer: 'ic_add_24px' (shape)
                                  SvgPicture.string(
                                _svg_m83s6c,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Pinned.fromPins(
                Pin(start: 0.0, end: 0.0),
                Pin(size: 40.0, middle: 0.5),
                child:
                    // Adobe XD layer: 'About US' (group)
                    Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 115.0, start: 20.0),
                      Pin(size: 25.0, middle: 0.5333),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 85.0, end: 0.0),
                            Pin(start: 0.0, end: 0.0),
                            child: Text(
                              'About US',
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
                            Pin(size: 18.0, start: 0.0),
                            Pin(start: 3.0, end: 2.0),
                            child:
                                // Adobe XD layer: 'ic_perm_contact_cal…' (shape)
                                SvgPicture.string(
                              _svg_u4i99g,
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
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
                Pin(size: 40.0, middle: 0.25),
                child:
                    // Adobe XD layer: 'Social Amenities' (group)
                    PageLink(
                  links: [
                    PageLinkInfo(
                      ease: Curves.easeInOutExpo,
                      duration: 1.0,
                      pageBuilder: () => SocialAmenities(),
                    ),
                  ],
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 186.0, start: 20.0),
                        Pin(size: 25.0, middle: 0.5333),
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(size: 156.0, end: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child: Text(
                                'Social Amenities',
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
                              Pin(size: 16.0, start: 0.0),
                              Pin(start: 6.0, end: 5.0),
                              child:
                                  // Adobe XD layer: 'ic_view_headline_24…' (shape)
                                  SvgPicture.string(
                                _svg_e4we19,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Pinned.fromPins(
                Pin(start: 0.0, end: 0.0),
                Pin(size: 40.0, start: 0.0),
                child:
                    // Adobe XD layer: 'Find a Service' (group)
                    PageLink(
                  links: [
                    PageLinkInfo(
                      ease: Curves.easeInOutExpo,
                      duration: 1.0,
                      pageBuilder: () => HomeScreen(),
                    ),
                  ],
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 160.0, start: 20.0),
                        Pin(size: 25.0, middle: 0.5333),
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(size: 130.0, end: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child: Text(
                                'Find A Service',
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
                              Pin(size: 14.0, start: 0.0),
                              Pin(start: 3.0, end: 2.0),
                              child:
                                  // Adobe XD layer: 'ic_room_24px' (shape)
                                  SvgPicture.string(
                                _svg_nb8mn,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
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
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff3583bd),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x33000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 119.0, start: 20.0),
          Pin(size: 35.0, start: 21.0),
          child: Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                color: const Color(0xffffffff),
                letterSpacing: 1,
              ),
              children: [
                TextSpan(
                  text: 'Com',
                ),
                TextSpan(
                  text: 'Link',
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
          Pin(size: 30.0, end: 23.0),
          Pin(size: 30.0, middle: 0.0281),
          child:
              // Adobe XD layer: 'ic_close_24px' (shape)
              SvgPicture.string(
            _svg_zqs,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

// ignore: constant_identifier_names
const String _svg_m83s6c =
    '<svg viewBox="45.0 111.0 19.2 19.2" ><path transform="translate(40.0, 106.0)" d="M 24.15130615234375 15.943603515625 L 15.943603515625 15.943603515625 L 15.943603515625 24.15130615234375 L 13.20770263671875 24.15130615234375 L 13.20770263671875 15.943603515625 L 5 15.943603515625 L 5 13.20770263671875 L 13.20770263671875 13.20770263671875 L 13.20770263671875 5 L 15.943603515625 5 L 15.943603515625 13.20770263671875 L 24.15130615234375 13.20770263671875 L 24.15130615234375 15.943603515625 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_u4i99g =
    '<svg viewBox="37.0 111.0 18.0 20.0" ><path transform="translate(34.0, 110.0)" d="M 19 3 L 18 3 L 18 1 L 16 1 L 16 3 L 8 3 L 8 1 L 6 1 L 6 3 L 5 3 C 3.889999866485596 3 3 3.900000095367432 3 5 L 3 19 C 3 20.10000038146973 3.889999866485596 21 5 21 L 19 21 C 20.10000038146973 21 21 20.10000038146973 21 19 L 21 5 C 21 3.900000095367432 20.10000038146973 3 19 3 Z M 12 6 C 13.65999984741211 6 15 7.340000152587891 15 9 C 15 10.65999984741211 13.65999984741211 12 12 12 C 10.34000015258789 12 9 10.65999984741211 9 9 C 9 7.340000152587891 10.34000015258789 6 12 6 Z M 18 18 L 6 18 L 6 17 C 6 15 10 13.89999961853027 12 13.89999961853027 C 14 13.89999961853027 18 15 18 17 L 18 18 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_e4we19 =
    '<svg viewBox="40.0 114.0 16.0 14.0" ><path transform="translate(36.0, 109.0)" d="M 4 15 L 20 15 L 20 13 L 4 13 L 4 15 Z M 4 19 L 20 19 L 20 17 L 4 17 L 4 19 Z M 4 11 L 20 11 L 20 9 L 4 9 L 4 11 Z M 4 5 L 4 7 L 20 7 L 20 5 L 4 5 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_nb8mn =
    '<svg viewBox="42.0 111.0 14.0 20.0" ><path transform="translate(37.0, 109.0)" d="M 12 2 C 8.130000114440918 2 5 5.130000114440918 5 9 C 5 14.25 12 22 12 22 C 12 22 19 14.25 19 9 C 19 5.130000114440918 15.86999988555908 2 12 2 Z M 12 11.5 C 10.61999988555908 11.5 9.5 10.38000011444092 9.5 9 C 9.5 7.619999885559082 10.61999988555908 6.5 12 6.5 C 13.38000011444092 6.5 14.5 7.619999885559082 14.5 9 C 14.5 10.38000011444092 13.38000011444092 11.5 12 11.5 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_zqs =
    '<svg viewBox="322.0 22.0 30.0 30.0" ><path transform="translate(317.0, 17.0)" d="M 35 8.021428108215332 L 31.97856712341309 5.000000953674316 L 19.99999618530273 16.97856903076172 L 8.021428108215332 5.000000953674316 L 5.000000953674316 8.021428108215332 L 16.97856903076172 19.99999618530273 L 5.000000953674316 31.97856712341309 L 8.021428108215332 35 L 19.99999618530273 23.02142524719238 L 31.97856712341309 35 L 35 31.97856712341309 L 23.02142524719238 19.99999618530273 L 35 8.021428108215332 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
