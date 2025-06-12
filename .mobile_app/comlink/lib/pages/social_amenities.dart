import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/product_page.dart';
import 'package:adobe_xd/page_link.dart';
import '../components/regular_top_bar.dart';

class SocialAmenities extends StatelessWidget {
  const SocialAmenities({
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
            Pin(start: 20.0, end: 20.0),
            Pin(size: 727.0, end: -162.0),
            child:
                // Adobe XD layer: 'Results' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.easeInOutExpo,
                  duration: 1.0,
                  pageBuilder: () => ProductPage(),
                ),
              ],
              child: SingleChildScrollView(
                primary: false,
                child: SizedBox(
                  width: 335.0,
                  height: 945.0,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, -218.0),
                        child:
                            // Adobe XD layer: 'Product Card' (grid)
                            SingleChildScrollView(
                          primary: false,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 20,
                            runSpacing: 20,
                            children: [{}, {}, {}].map((itemData) {
                              return SizedBox(
                                width: 335.0,
                                height: 300.0,
                                child:
                                    // Adobe XD layer: 'Product Card' (group)
                                    Stack(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        border: Border.all(
                                            width: 0.5,
                                            color: const Color(0xff707070)),
                                      ),
                                    ),
                                    Pinned.fromPins(
                                      Pin(start: 18.0, end: 17.0),
                                      Pin(size: 45.0, end: 20.0),
                                      child:
                                          // Adobe XD layer: 'Call Button' (group)
                                          Stack(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xfff64743),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(0.032, 0.003),
                                            child: SizedBox(
                                              width: 207.0,
                                              height: 21.0,
                                              child: Stack(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            26.0,
                                                            0.0,
                                                            0.0,
                                                            0.1),
                                                    child: SizedBox.expand(
                                                        child: Text(
                                                      'Call (+233) 840-141-913',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15,
                                                        color: const Color(
                                                            0xffffffff),
                                                        letterSpacing: 0.3,
                                                      ),
                                                      softWrap: false,
                                                    )),
                                                  ),
                                                  Pinned.fromPins(
                                                    Pin(size: 21.1, start: 0.0),
                                                    Pin(start: 0.0, end: 0.0),
                                                    child:
                                                        // Adobe XD layer: 'ic_call_24px' (shape)
                                                        SvgPicture.string(
                                                      _svg_m87zlb,
                                                      allowDrawingOutsideViewBox:
                                                          true,
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
                                      Pin(size: 134.0, start: 18.0),
                                      Pin(size: 25.0, middle: 0.7273),
                                      child: Text(
                                        'Product Name',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          color: const Color(0xff215066),
                                          letterSpacing: 0.36,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        softWrap: false,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 80.0, middle: 0.2008),
            child:
                // Adobe XD layer: 'Categories' (group)
                SingleChildScrollView(
              primary: false,
              child: SizedBox(
                width: 729.0,
                height: 79.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(size: 26.0, start: 30.5),
                      Pin(size: 1.0, end: 0.5),
                      child:
                          // Adobe XD layer: 'active line' (shape)
                          SvgPicture.string(
                        _svg_rxmoxb,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, -354.0, 6.0),
                      child:
                          // Adobe XD layer: 'Categories' (grid)
                          SingleChildScrollView(
                        primary: false,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 46,
                          runSpacing: 20,
                          children: [{}, {}].map((itemData) {
                            return SizedBox(
                              width: 335.0,
                              height: 74.0,
                              child:
                                  // Adobe XD layer: 'Categories' (group)
                                  Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      width: 47.0,
                                      height: 16.0,
                                      child: Text(
                                        'Markets',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 11,
                                          color: const Color(0xffffffff),
                                          letterSpacing: 0.44,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        softWrap: false,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 48.0,
                                      height: 47.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0.322, 1.0),
                                    child: SizedBox(
                                      width: 37.0,
                                      height: 16.0,
                                      child: Text(
                                        'Hotels',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 11,
                                          color: const Color(0xffffffff),
                                          letterSpacing: 0.44,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        softWrap: false,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0.338, -1.0),
                                    child: Container(
                                      width: 48.0,
                                      height: 47.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(-0.329, 1.0),
                                    child: SizedBox(
                                      width: 43.0,
                                      height: 16.0,
                                      child: Text(
                                        'Church',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 11,
                                          color: const Color(0xffffffff),
                                          letterSpacing: 0.44,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        softWrap: false,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(-0.338, -1.0),
                                    child: Container(
                                      width: 48.0,
                                      height: 47.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 40.0, start: 4.0),
                                    Pin(size: 16.0, end: 0.0),
                                    child: Text(
                                      'School',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 11,
                                        color: const Color(0xffffffff),
                                        letterSpacing: 0.44,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      softWrap: false,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 48.0,
                                      height: 47.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 20.0),
            Pin(size: 42.0, start: 85.0),
            child:
                // Adobe XD layer: 'Search' (group)
                Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfffffcfc),
                    borderRadius: BorderRadius.circular(20.0),
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
                  Pin(size: 81.0, start: 39.0),
                  Pin(size: 15.0, middle: 0.5185),
                  child: Text(
                    'Search an Item',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      color: const Color(0xff707070),
                      letterSpacing: 0.4,
                      fontWeight: FontWeight.w300,
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 15.3, start: 16.0),
                  Pin(size: 15.3, middle: 0.4865),
                  child:
                      // Adobe XD layer: 'ic_search_24px' (shape)
                      SvgPicture.string(
                    _svg_d35vno,
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
                // Adobe XD layer: 'Regular Top Bar' (component)
                RegularTopBar(),
          ),
        ],
      ),
    );
  }
}
// ignore: constant_identifier_names
const String _svg_m87zlb =
    '<svg viewBox="0.0 0.0 21.1 21.1" ><path transform="translate(-3.0, -3.0)" d="M 7.238787651062012 12.1215877532959 C 8.924933433532715 15.43533611297607 11.64150428771973 18.14019775390625 14.9552526473999 19.83805465698242 L 17.53131103515625 17.26199722290039 C 17.84746360778809 16.94584465026855 18.31583786010742 16.84046173095703 18.72566795349121 16.9809741973877 C 20.0371150970459 17.41421890258789 21.45394515991211 17.64840507507324 22.90590476989746 17.64840507507324 C 23.54991912841797 17.64840507507324 24.07684326171875 18.17532730102539 24.07684326171875 18.81934356689453 L 24.07684326171875 22.90590476989746 C 24.07684326171875 23.54991912841797 23.54991912841797 24.07684326171875 22.90590476989746 24.07684326171875 C 11.9108190536499 24.07684326171875 3 15.16602039337158 3 4.170936107635498 C 3 3.526921272277832 3.526921272277832 3 4.170936107635498 3 L 8.269210815429688 3 C 8.913225173950195 3 9.440146446228027 3.526921272277832 9.440146446228027 4.170936107635498 C 9.440146446228027 5.634605884552002 9.674332618713379 7.03972864151001 10.10757923126221 8.351175308227539 C 10.2363805770874 8.761003494262695 10.1427059173584 9.217667579650879 9.814844131469727 9.545530319213867 L 7.238787651062012 12.1215877532959 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_rxmoxb =
    '<svg viewBox="10.5 78.5 26.0 1.0" ><path transform="translate(10.5, 78.5)" d="M 0 0 L 26 0" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
// ignore: constant_identifier_names
const String _svg_d35vno =
    '<svg viewBox="36.0 33.0 15.3 15.3" ><path transform="translate(33.0, 30.0)" d="M 13.91836643218994 12.60816192626953 L 13.22832489013672 12.60816192626953 L 12.98375415802002 12.37232494354248 C 13.83975315093994 11.37657070159912 14.35510063171387 10.08383560180664 14.35510063171387 8.677550315856934 C 14.35510063171387 5.541795253753662 11.81330490112305 3 8.677550315856934 3 C 5.541795253753662 3 3 5.541795253753662 3 8.677550315856934 C 3 11.81330490112305 5.541795253753662 14.35510063171387 8.677550315856934 14.35510063171387 C 10.08383560180664 14.35510063171387 11.37657070159912 13.83975315093994 12.37232494354248 12.98375415802002 L 12.60816192626953 13.22832489013672 L 12.60816192626953 13.91836643218994 L 16.97550964355469 18.27697944641113 L 18.27697944641113 16.97550964355469 L 13.91836643218994 12.60816192626953 Z M 8.677550315856934 12.60816192626953 C 6.502612113952637 12.60816192626953 4.746938228607178 10.85248851776123 4.746938228607178 8.677550315856934 C 4.746938228607178 6.502612113952637 6.502612113952637 4.746938228607178 8.677550315856934 4.746938228607178 C 10.85248851776123 4.746938228607178 12.60816192626953 6.502612113952637 12.60816192626953 8.677550315856934 C 12.60816192626953 10.85248851776123 10.85248851776123 12.60816192626953 8.677550315856934 12.60816192626953 Z" fill="#95989a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
