import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import '../components/rtbtoggle.dart';
import './sign_up_regular.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
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
            decoration: BoxDecoration(
              color: const Color(0xff3583bd),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 31.0, end: 31.0),
            Pin(size: 45.0, middle: 0.6519),
            child:
                // Adobe XD layer: 'Continue With Google' (group)
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
                  Pin(start: 40.9, end: 40.1),
                  Pin(size: 23.0, middle: 0.5),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 196.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: Text(
                          'Continue With Google',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: const Color(0xff000000),
                            letterSpacing: 1.12,
                            height: 1.25,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 16.0, start: 0.0),
                        Pin(start: 4.0, end: 3.0),
                        child:
                            // Adobe XD layer: 'ic_perm_identity_24…' (shape)
                            SvgPicture.string(
                          _svg_tfn4d5,
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
            Pin(start: 31.0, end: 31.0),
            Pin(size: 45.0, middle: 0.528),
            child:
                // Adobe XD layer: 'Continue button' (group)
                Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff64743),
                    borderRadius: BorderRadius.circular(7.0),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 62.0,
                    height: 23.0,
                    child: Text(
                      'Submit',
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
          Pinned.fromPins(
            Pin(start: 31.0, end: 31.0),
            Pin(size: 45.0, middle: 0.3299),
            child:
                // Adobe XD layer: 'Login Field' (group)
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
                  Pin(size: 48.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: const Color(0xffb8aaaa),
                      letterSpacing: 1.12,
                      height: 1.25,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.003, 0.176),
            child: SizedBox(
              width: 18.0,
              height: 23.0,
              child: Text(
                'or',
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
          Align(
            alignment: Alignment(0.0, -0.547),
            child: SizedBox(
              width: 78.0,
              height: 35.0,
              child: Text(
                'Log in',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25,
                  color: const Color(0xffffffff),
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  height: 2,
                  shadows: [
                    Shadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    )
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 65.0, start: 0.0),
            child:
                // Adobe XD layer: 'Regular Top Bar' (component)
                RtbToggle(),
          ),
          Pinned.fromPins(
            Pin(start: 31.0, end: 31.0),
            Pin(size: 45.0, middle: 0.4146),
            child:
                // Adobe XD layer: 'Login Field' (group)
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
                  Pin(size: 85.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: const Color(0xffb8aaaa),
                      letterSpacing: 1.12,
                      height: 1.25,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 31.0, end: 31.0),
            Pin(size: 43.0, end: 80.0),
            child:
                // Adobe XD layer: 'Use phone' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.easeInOut,
                  duration: 1.0,
                  pageBuilder: () => SignUpRegular(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0x57ffffff),
                      borderRadius: BorderRadius.circular(22.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 174.0,
                      height: 23.0,
                      child: Text(
                        'Don\'t have Account',
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
        ],
      ),
    );
  }
}

// ignore: constant_identifier_names
const String _svg_tfn4d5 =
    '<svg viewBox="0.0 4.0 16.0 16.0" ><path transform="translate(-4.0, 0.0)" d="M 12 5.900000095367432 C 13.15999984741211 5.900000095367432 14.10000038146973 6.840000152587891 14.10000038146973 8 C 14.10000038146973 9.159999847412109 13.16000080108643 10.10000038146973 12 10.10000038146973 C 10.83999919891357 10.10000038146973 9.899999618530273 9.159999847412109 9.899999618530273 8 C 9.899999618530273 6.840000152587891 10.83999919891357 5.900000095367432 12 5.900000095367432 M 12 14.89999961853027 C 14.97000026702881 14.89999961853027 18.10000038146973 16.36000061035156 18.10000038146973 17 L 18.10000038146973 18.10000038146973 L 5.900000095367432 18.10000038146973 L 5.900000095367432 17 C 5.900000095367432 16.36000061035156 9.030000686645508 14.89999961853027 12 14.89999961853027 M 12 4 C 9.789999961853027 4 8 5.789999961853027 8 8 C 8 10.21000003814697 9.789999961853027 12 12 12 C 14.21000003814697 12 16 10.21000003814697 16 8 C 16 5.789999961853027 14.21000003814697 4 12 4 Z M 12 13 C 9.329999923706055 13 4 14.34000015258789 4 17 L 4 20 L 20 20 L 20 17 C 20 14.34000015258789 14.67000007629395 13 12 13 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
