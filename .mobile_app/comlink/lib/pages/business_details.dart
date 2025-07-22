import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './back_top_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessDetails extends StatelessWidget {
  BusinessDetails({
    Key? key,
  }) : super(key: key);
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
            Pin(size: 415.0, end: 120.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 216.0,
                    height: 17.0,
                    child:
                        // Adobe XD layer: 'Username' (text)
                        Text(
                      'Only *.jpg and *.png supported.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: const Color(0xff5a5a5a),
                        letterSpacing: 0.8400000000000001,
                        fontWeight: FontWeight.w500,
                        height: 1.6666666666666667,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 70.0, start: 0.0),
                  Pin(size: 70.0, end: 37.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffe9f8e8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 20.0, start: 25.0),
                  Pin(size: 20.0, end: 62.0),
                  child:
                      // Adobe XD layer: 'ic_add_circle_outli…' (shape)
                      SvgPicture.string(
                    _svg_g1y6f5,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment(-1.0, 0.387),
                  child: SizedBox(
                    width: 45.0,
                    height: 17.0,
                    child:
                        // Adobe XD layer: 'Username' (text)
                        Text(
                      'Photos',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: const Color(0xff000000),
                        letterSpacing: 0.8400000000000001,
                        fontWeight: FontWeight.w500,
                        height: 1.6666666666666667,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 53.0, middle: 0.5608),
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
                        Pin(size: 204.0, start: 20.0),
                        Pin(size: 20.0, middle: 0.6364),
                        child: Text(
                          'Lorem Ipsum something...',
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
                        Pin(size: 151.0, start: 17.0),
                        Pin(size: 17.0, start: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: const Color(0xffffffff),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(4.0, 0.0, 6.0, 0.0),
                              child: SizedBox.expand(
                                  child:
                                      // Adobe XD layer: 'Username' (text)
                                      Text(
                                'Business Description',
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
                  Pin(size: 53.0, middle: 0.3591),
                  child:
                      // Adobe XD layer: 'Category' (group)
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
                        Pin(size: 84.0, start: 20.0),
                        Pin(size: 23.0, middle: 0.6333),
                        child: Text(
                          'Plumbing',
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
                        Pin(size: 14.3, end: 19.7),
                        Pin(size: 7.2, middle: 0.589),
                        child:
                            // Adobe XD layer: 'ic_arrow_drop_down_…' (shape)
                            SvgPicture.string(
                          _svg_ao569x,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 72.0, start: 17.0),
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
                                'Category',
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
                  Pin(size: 53.0, middle: 0.1796),
                  child:
                      // Adobe XD layer: 'Type of Business' (group)
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
                        Pin(size: 133.0, start: 20.0),
                        Pin(size: 23.0, middle: 0.6333),
                        child: Text(
                          'Social Amenity',
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
                        Pin(size: 14.3, end: 19.7),
                        Pin(size: 7.2, middle: 0.589),
                        child:
                            // Adobe XD layer: 'ic_arrow_drop_down_…' (shape)
                            SvgPicture.string(
                          _svg_ao569x,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 111.0, start: 17.0),
                        Pin(size: 17.0, start: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: const Color(0xffffffff),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(4.0, 0.0, 12.0, 0.0),
                              child: SizedBox.expand(
                                  child:
                                      // Adobe XD layer: 'Username' (text)
                                      Text(
                                'Business Type',
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
                      // Adobe XD layer: 'Name of Business' (group)
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
                        Pin(size: 142.0, start: 15.0),
                        Pin(size: 23.0, middle: 0.6333),
                        child: Text(
                          'Danny Ventures',
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
                        Pin(size: 111.0, start: 17.0),
                        Pin(size: 17.0, start: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: const Color(0xffffffff),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 0.0),
                              child: SizedBox.expand(
                                  child:
                                      // Adobe XD layer: 'Username' (text)
                                      Text(
                                'Business Name',
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
          Align(
            alignment: Alignment(0.0, -0.414),
            child: SizedBox(
              width: 104.0,
              height: 23.0,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(25.3, 0.0, 0.0, 0.0),
                    child:
                        // Adobe XD layer: 'Upload' (group)
                        Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff707070)),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 52.5, start: 8.8),
                          Pin(size: 12.4, middle: 0.4432),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  width: 34.0,
                                  height: 10.0,
                                  child:
                                      // Adobe XD layer: 'Name' (text)
                                      Text(
                                    'Upload',
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 9,
                                      color: const Color(0xff11141a),
                                      letterSpacing: 0.3750000114440918,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 9.4, start: 0.0),
                                Pin(start: 1.0, end: 0.0),
                                child:
                                    // Adobe XD layer: 'ic_file_upload_24px' (shape)
                                    SvgPicture.string(
                                  _svg_p7oz,
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
                    Pin(size: 11.4, start: 0.0),
                    Pin(start: 4.3, end: 4.4),
                    child:
                        // Adobe XD layer: 'ic_delete_forever_2…' (shape)
                        SvgPicture.string(
                      _svg_r3d0q,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 116.0, middle: 0.5019),
            Pin(size: 116.0, start: 95.0),
            child:
                // Adobe XD layer: 'avatar' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/avatar.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 1.0, color: const Color(0xff000000)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_g1y6f5 =
    '<svg viewBox="62.0 628.0 20.0 20.0" ><path transform="translate(60.0, 626.0)" d="M 13 7 L 11 7 L 11 11 L 7 11 L 7 13 L 11 13 L 11 17 L 13 17 L 13 13 L 17 13 L 17 11 L 13 11 L 13 7 Z M 12 2 C 6.480000019073486 2 2 6.480000019073486 2 12 C 2 17.52000045776367 6.480000019073486 22 12 22 C 17.52000045776367 22 22 17.52000045776367 22 12 C 22 6.479999542236328 17.52000045776367 2 12 2 Z M 12 20 C 7.590000152587891 20 4 16.40999984741211 4 12 C 4 7.590000152587891 7.590000152587891 4 12 4 C 16.40999984741211 4 20 7.590000152587891 20 12 C 20 16.40999984741211 16.40999984741211 20 12 20 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ao569x =
    '<svg viewBox="288.0 443.0 14.3 7.2" ><path transform="translate(281.0, 433.0)" d="M 7 10 L 14.15801906585693 17.15802192687988 L 21.3160400390625 10 L 7 10 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p7oz =
    '<svg viewBox="0.0 1.0 9.4 11.4" ><path transform="translate(-5.0, -2.03)" d="M 7.682825088500977 11.71918392181396 L 11.70706558227539 11.71918392181396 L 11.70706558227539 7.694945812225342 L 14.389892578125 7.694945812225342 L 9.694945335388184 2.999999761581421 L 5 7.694945812225342 L 7.682825088500977 7.694945812225342 L 7.682825088500977 11.71918392181396 Z M 5 13.06059551239014 L 14.389892578125 13.06059551239014 L 14.389892578125 14.40200805664062 L 5 14.40200805664062 L 5 13.06059551239014 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r3d0q =
    '<svg viewBox="271.0 135.9 11.4 14.7" ><path transform="translate(266.02, 132.91)" d="M 5.817496776580811 16.07995796203613 C 5.817496776580811 16.97920036315918 6.553245544433594 17.71495246887207 7.452491760253906 17.71495246887207 L 13.99247360229492 17.71495246887207 C 14.89172172546387 17.71495246887207 15.62746906280518 16.97920036315918 15.62746906280518 16.07995796203613 L 15.62746906280518 6.269989490509033 L 5.817496776580811 6.269989490509033 L 5.817496776580811 16.07995796203613 Z M 7.828540802001953 10.25937652587891 L 8.981213569641113 9.106706619262695 L 10.72248363494873 10.83979988098145 L 12.4555778503418 9.106706619262695 L 13.60825061798096 10.25937652587891 L 11.87515449523926 11.99247169494629 L 13.60825061798096 13.72556304931641 L 12.4555778503418 14.87823486328125 L 10.72248363494873 13.14514350891113 L 8.989388465881348 14.87823486328125 L 7.836715698242188 13.72556304931641 L 9.56981086730957 11.99247169494629 L 7.828540802001953 10.25937652587891 Z M 13.58372592926025 3.81749701499939 L 12.76622676849365 2.999999046325684 L 8.678738594055176 2.999999046325684 L 7.861240386962891 3.81749701499939 L 5 3.81749701499939 L 5 5.452491760253906 L 16.4449634552002 5.452491760253906 L 16.4449634552002 3.81749701499939 L 13.58372592926025 3.81749701499939 Z" fill="#f35162" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
