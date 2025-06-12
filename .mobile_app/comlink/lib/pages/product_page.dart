import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 300.0, start: 0.0),
            child:
                // Adobe XD layer: 'Images' (shape)
                Container(
              color: const Color(0xff3583bd),
            ),
          ),
          Align(
            alignment: Alignment(0.003, -0.583),
            child: SizedBox(
              width: 56.0,
              height: 8.0,
              child:
                  // Adobe XD layer: 'Dot counter' (group)
                  Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 8.0, start: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 8.0, middle: 0.3333),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xbfffffff),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 8.0, middle: 0.6667),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0x80ffffff),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 8.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0x40ffffff),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(size: 25.0, start: 20.0),
            child:
                // Adobe XD layer: 'top menu buttons' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 25.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'back button' (group)
                      Stack(
                    children: <Widget>[
                      // Adobe XD layer: 'back button' (shape)
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
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
                        Pin(size: 10.4, middle: 0.4796),
                        Pin(start: 4.0, end: 4.1),
                        child:
                            // Adobe XD layer: 'ic_keyboard_arrow_l…' (shape)
                            SvgPicture.string(
                          _svg_faqg3k,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 25.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'bookmark' (group)
                      Stack(
                    children: <Widget>[
                      // Adobe XD layer: 'bookmark' (shape)
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
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
                        Pin(size: 10.9, middle: 0.4963),
                        Pin(start: 5.0, end: 6.0),
                        child:
                            // Adobe XD layer: 'ic_turned_in_not_24…' (shape)
                            SvgPicture.string(
                          _svg_al8mit,
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
            Pin(size: 147.0, start: 20.0),
            Pin(size: 27.0, middle: 0.2476),
            child: Text(
              'Product Name',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 19,
                color: const Color(0xff000000),
                letterSpacing: 0.76,
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(size: 89.0, middle: 0.2887),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: const Color(0xff000000),
                  letterSpacing: 0.72,
                ),
                children: [
                  TextSpan(
                    text:
                        'The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for quick jigs vex! Fox nymphs grab quick-jived waltz. Brick quiz…',
                  ),
                  TextSpan(
                    text: 'more',
                    style: TextStyle(
                      color: const Color(0xff3583bd),
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 68.0, start: 20.0),
            Pin(size: 21.0, middle: 0.3547),
            child: Text(
              'Services',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: const Color(0xff000000),
                letterSpacing: 0.6,
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(size: 89.0, middle: 0.3997),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: const Color(0xff000000),
                  letterSpacing: 0.72,
                ),
                children: [
                  TextSpan(
                    text:
                        'The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for quick jigs vex! Fox nymphs grab quick-jived waltz. Brick quiz…',
                  ),
                  TextSpan(
                    text: 'more',
                    style: TextStyle(
                      color: const Color(0xff3583bd),
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 69.0, start: 20.0),
            Pin(size: 21.0, middle: 0.4563),
            child: Text(
              'Location',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: const Color(0xff000000),
                letterSpacing: 0.6,
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(size: 200.0, middle: 0.5733),
            child: Container(
              color: const Color(0xffa8a8a8),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 217.0, start: 20.0),
            Pin(size: 17.0, middle: 0.4713),
            child: Text(
              'Street Name - Community name',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: const Color(0xff000000),
                letterSpacing: 0.72,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 111.0, start: 20.0),
            Pin(size: 21.0, middle: 0.6609),
            child: Text(
              'Service Hours',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: const Color(0xff000000),
                letterSpacing: 0.6,
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 287.0, start: 20.0),
            Pin(size: 35.0, middle: 0.6875),
            child: Text(
              'For further information, please contact the \nbusiness directly.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: const Color(0xff000000),
                letterSpacing: 0.72,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 185.0, start: 20.0),
            Pin(size: 21.0, middle: 0.7214),
            child: Text(
              'Additional Information',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: const Color(0xff000000),
                letterSpacing: 0.6,
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 287.0, start: 20.0),
            Pin(size: 35.0, middle: 0.7487),
            child: Text(
              'For further information, please contact the \nbusiness directly.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: const Color(0xff000000),
                letterSpacing: 0.72,
              ),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 275.0, end: 20.0),
            child: Stack(
              children: <Widget>[
                Container(
                  color: const Color(0xffeeeeee),
                ),
                Pinned.fromPins(
                  Pin(size: 261.0, middle: 0.5),
                  Pin(size: 35.0, start: 15.0),
                  child: Text(
                    'Related Categories',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      color: const Color(0xff000000),
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 42.0, end: 41.0),
                  Pin(size: 178.0, end: 27.0),
                  child:
                      // Adobe XD layer: 'Categories' (group)
                      Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 48.0,
                          height: 47.0,
                          decoration: BoxDecoration(
                            color: const Color(0xff1d25ff),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-1.0, 0.588),
                        child: Container(
                          width: 48.0,
                          height: 47.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffe652f1),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.336, -1.0),
                        child: Container(
                          width: 48.0,
                          height: 47.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffd8e522),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.336, 0.588),
                        child: Container(
                          width: 48.0,
                          height: 47.0,
                          decoration: BoxDecoration(
                            color: const Color(0xff19dea8),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.336, -1.0),
                        child: Container(
                          width: 48.0,
                          height: 47.0,
                          decoration: BoxDecoration(
                            color: const Color(0xff21b854),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.328, 0.588),
                        child: Container(
                          width: 48.0,
                          height: 47.0,
                          decoration: BoxDecoration(
                            color: const Color(0xffd122b9),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 48.0,
                          height: 47.0,
                          decoration: BoxDecoration(
                            color: const Color(0xff292dae),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 48.0, end: 1.0),
                        Pin(size: 47.0, middle: 0.7939),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe13232),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 40.0, start: 4.0),
                        Pin(size: 16.0, middle: 0.358),
                        child: Text(
                          'School',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            color: const Color(0xff000000),
                            letterSpacing: 0.44,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: false,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          width: 40.0,
                          height: 16.0,
                          child: Text(
                            'School',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              color: const Color(0xff000000),
                              letterSpacing: 0.44,
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.325, -0.284),
                        child: SizedBox(
                          width: 43.0,
                          height: 16.0,
                          child: Text(
                            'Church',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              color: const Color(0xff000000),
                              letterSpacing: 0.44,
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.357, 1.0),
                        child: SizedBox(
                          width: 43.0,
                          height: 16.0,
                          child: Text(
                            'Church',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              color: const Color(0xff000000),
                              letterSpacing: 0.44,
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.318, -0.284),
                        child: SizedBox(
                          width: 37.0,
                          height: 16.0,
                          child: Text(
                            'Hotels',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              color: const Color(0xff000000),
                              letterSpacing: 0.44,
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.286, 1.0),
                        child: SizedBox(
                          width: 37.0,
                          height: 16.0,
                          child: Text(
                            'Hotels',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              color: const Color(0xff000000),
                              letterSpacing: 0.44,
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(1.0, -0.284),
                        child: SizedBox(
                          width: 47.0,
                          height: 16.0,
                          child: Text(
                            'Markets',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              color: const Color(0xff000000),
                              letterSpacing: 0.44,
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.0, end: 4.0),
                        Pin(size: 16.0, end: 0.0),
                        child: Text(
                          'Markets',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            color: const Color(0xff000000),
                            letterSpacing: 0.44,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 54.0, end: 20.0),
            Pin(size: 54.0, middle: 0.209),
            child:
                // Adobe XD layer: 'Call Button' (group)
                Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff64743),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 27.0,
                    height: 27.0,
                    child:
                        // Adobe XD layer: 'ic_phone_24px' (shape)
                        SvgPicture.string(
                      _svg_muj6nw,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: constant_identifier_names
const String _svg_faqg3k =
    '<svg viewBox="27.0 24.0 10.4 16.9" ><path transform="translate(19.0, 18.5)" d="M 18.40534591674805 20.37080001831055 L 11.97397136688232 13.92538261413574 L 18.40534591674805 7.479964256286621 L 16.42538070678711 5.499999046325684 L 7.999999046325684 13.92538261413574 L 16.42538070678711 22.35076332092285 L 18.40534591674805 20.37080001831055 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_al8mit =
    '<svg viewBox="337.0 25.0 10.9 14.0" ><path transform="translate(332.0, 22.0)" d="M 14.3379602432251 3 L 6.556326866149902 3 C 5.700347423553467 3 5.007781982421875 3.700347185134888 5.007781982421875 4.556326866149902 L 5 17.0069408416748 L 10.4471435546875 14.67245101928711 L 15.894287109375 17.0069408416748 L 15.894287109375 4.556326866149902 C 15.894287109375 3.700347185134888 15.19394111633301 3 14.3379602432251 3 Z M 14.3379602432251 14.67245101928711 L 10.4471435546875 12.97605419158936 L 6.556326866149902 14.67245101928711 L 6.556326866149902 4.556326866149902 L 14.3379602432251 4.556326866149902 L 14.3379602432251 14.67245101928711 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_muj6nw =
    '<svg viewBox="315.0 287.0 26.9 26.9" ><path transform="translate(312.0, 284.0)" d="M 8.40196418762207 14.62466621398926 C 10.55080986022949 18.84774971008301 14.01284217834473 22.29485893249512 18.23592567443848 24.4586296081543 L 21.51888656616211 21.17566871643066 C 21.92179489135742 20.77276039123535 22.51869583129883 20.63845825195312 23.04098701477051 20.81752967834473 C 24.71231460571289 21.36966133117676 26.51794242858887 21.66811180114746 28.36833763122559 21.66811180114746 C 29.18907737731934 21.66811180114746 29.86059379577637 22.33962821960449 29.86059379577637 23.16036987304688 L 29.86059379577637 28.36833763122559 C 29.86059379577637 29.18907737731934 29.18907737731934 29.86059379577637 28.36833763122559 29.86059379577637 C 14.35606098175049 29.86059379577637 3.000000238418579 18.50452995300293 3.000000238418579 4.492255210876465 C 3.000000238418579 3.671515226364136 3.671515226364136 3.000000238418579 4.492255210876465 3.000000238418579 L 9.71514892578125 3.000000238418579 C 10.53588962554932 3.000000238418579 11.2074031829834 3.671515226364136 11.2074031829834 4.492255210876465 C 11.2074031829834 6.357574462890625 11.50585460662842 8.148281097412109 12.05798816680908 9.819605827331543 C 12.22213554382324 10.34189510345459 12.10275650024414 10.9238748550415 11.68492412567139 11.34170722961426 L 8.40196418762207 14.62466621398926 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
