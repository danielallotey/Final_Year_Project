import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import '../components/back_top_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({
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
            Pin(start: 30.0, end: 37.5),
            Pin(size: 349.0, start: 89.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 138.0,
                    height: 51.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 30.0, start: 0.0),
                          child: Text(
                            'ComLink Inc.',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 22,
                              color: const Color(0xff000000),
                              letterSpacing: 0.88,
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 17.0),
                          Pin(size: 19.0, end: 0.0),
                          child: Text(
                            'Version 1.2025.1.0',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 14,
                              color: const Color(0xff757474),
                              letterSpacing: 0.56,
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 141.0,
                    height: 19.0,
                    child: Text(
                      '2025 @ Comlink Inc.',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 14,
                        color: const Color(0xff000000),
                        letterSpacing: 0.56,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, middle: 0.204),
                  child: SvgPicture.string(
                    _svg_q464k9,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 39.5),
                  Pin(size: 111.0, middle: 0.3824),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 116.0,
                          height: 30.0,
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 22,
                              color: const Color(0xff000000),
                              letterSpacing: 0.88,
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 32.0, middle: 0.4557),
                        child: Text(
                          'We do like to know your thoughts about this \napp.',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 12,
                            color: const Color(0xff000000),
                            letterSpacing: 0.48,
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: false,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          width: 76.0,
                          height: 32.0,
                          child: Text(
                            'Contact us\nRate the App',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 12,
                              color: const Color(0xff1592e6),
                              letterSpacing: 0.48,
                              fontWeight: FontWeight.w600,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, middle: 0.6379),
                  child: SvgPicture.string(
                    _svg_z34xp5,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment(-1.0, 0.608),
                  child: SizedBox(
                    width: 144.0,
                    height: 48.0,
                    child: Text(
                      'Help Center\nLicenses\nTerms and Privacy Policy',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 12,
                        color: const Color(0xff1592e6),
                        letterSpacing: 0.48,
                        fontWeight: FontWeight.w600,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, end: 38.0),
                  child: SvgPicture.string(
                    _svg_r0u15z,
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
const String _svg_q464k9 =
    '<svg viewBox="30.0 160.0 307.5 1.0" ><path transform="translate(30.0, 160.0)" d="M 0 0 L 307.5 0" fill="none" stroke="#bbb6b6" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_z34xp5 =
    '<svg viewBox="30.0 311.0 307.5 1.0" ><path transform="translate(30.0, 311.0)" d="M 0 0 L 307.5 0" fill="none" stroke="#bbb6b6" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_r0u15z =
    '<svg viewBox="30.0 399.0 307.5 1.0" ><path transform="translate(30.0, 399.0)" d="M 0 0 L 307.5 0" fill="none" stroke="#bbb6b6" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
