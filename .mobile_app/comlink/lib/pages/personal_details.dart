import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './back_top_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails({
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
            Pin(start: 0.0, end: 0.0),
            Pin(size: 65.0, start: 0.0),
            child:
                // Adobe XD layer: 'Back Top Bar' (component)
                BackTopBar(),
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
            Pin(size: 345.0, middle: 0.6317),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 53.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'Date of Birth' (group)
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
                        Pin(size: 91.0, start: 20.0),
                        Pin(size: 20.0, middle: 0.6364),
                        child:
                            // Adobe XD layer: 'Password' (text)
                            Text(
                          '2002-04-01',
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
                        Pin(size: 97.0, start: 17.0),
                        Pin(size: 17.0, start: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: const Color(0xffffffff),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(6.0, 0.0, 7.0, 0.0),
                              child: SizedBox.expand(
                                  child:
                                      // Adobe XD layer: 'Password' (text)
                                      Text(
                                'Date of Birth',
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
                  Pin(size: 53.0, middle: 0.75),
                  child:
                      // Adobe XD layer: 'Gender' (group)
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
                        Pin(size: 37.0, start: 20.0),
                        Pin(size: 20.0, middle: 0.6364),
                        child:
                            // Adobe XD layer: 'Password' (text)
                            Text(
                          'Male',
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
                        Pin(size: 64.0, start: 17.0),
                        Pin(size: 17.0, start: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: const Color(0xffffffff),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(7.0, 0.0, 8.0, 0.0),
                              child: SizedBox.expand(
                                  child:
                                      // Adobe XD layer: 'Password' (text)
                                      Text(
                                'Gender',
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
                  Pin(size: 53.0, middle: 0.5),
                  child:
                      // Adobe XD layer: 'Location' (group)
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
                        Pin(size: 139.0, start: 20.0),
                        Pin(size: 20.0, middle: 0.6364),
                        child:
                            // Adobe XD layer: 'email' (text)
                            Text(
                          'Ningo-Prampram',
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
                        Pin(size: 70.0, start: 17.0),
                        Pin(size: 17.0, start: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: const Color(0xffffffff),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(7.0, 0.0, 6.0, 0.0),
                              child: SizedBox.expand(
                                  child:
                                      // Adobe XD layer: 'Email' (text)
                                      Text(
                                'Location',
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
                  Pin(size: 53.0, middle: 0.25),
                  child:
                      // Adobe XD layer: 'Phone' (group)
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
                        Pin(size: 136.0, start: 20.0),
                        Pin(size: 20.0, middle: 0.6364),
                        child:
                            // Adobe XD layer: '+233 50 366 5910' (text)
                            Text(
                          '+233 50 366 5910',
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
                        Pin(size: 51.0, start: 17.0),
                        Pin(size: 17.0, start: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: const Color(0xffffffff),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 0.0),
                              child: SizedBox.expand(
                                  child:
                                      // Adobe XD layer: 'Phone' (text)
                                      Text(
                                'Phone',
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
                        Pin(size: 109.0, start: 20.0),
                        Pin(size: 20.0, middle: 0.6364),
                        child: Text(
                          'Daniel Allotey',
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
                        Pin(size: 76.0, start: 17.0),
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
                                'Username',
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
          Align(
            alignment: Alignment(0.0, -0.369),
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
            Pin(size: 116.0, start: 113.0),
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

const String _svg_p7oz =
    '<svg viewBox="0.0 1.0 9.4 11.4" ><path transform="translate(-5.0, -2.03)" d="M 7.682825088500977 11.71918392181396 L 11.70706558227539 11.71918392181396 L 11.70706558227539 7.694945812225342 L 14.389892578125 7.694945812225342 L 9.694945335388184 2.999999761581421 L 5 7.694945812225342 L 7.682825088500977 7.694945812225342 L 7.682825088500977 11.71918392181396 Z M 5 13.06059551239014 L 14.389892578125 13.06059551239014 L 14.389892578125 14.40200805664062 L 5 14.40200805664062 L 5 13.06059551239014 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r3d0q =
    '<svg viewBox="271.0 135.9 11.4 14.7" ><path transform="translate(266.02, 132.91)" d="M 5.817496776580811 16.07995796203613 C 5.817496776580811 16.97920036315918 6.553245544433594 17.71495246887207 7.452491760253906 17.71495246887207 L 13.99247360229492 17.71495246887207 C 14.89172172546387 17.71495246887207 15.62746906280518 16.97920036315918 15.62746906280518 16.07995796203613 L 15.62746906280518 6.269989490509033 L 5.817496776580811 6.269989490509033 L 5.817496776580811 16.07995796203613 Z M 7.828540802001953 10.25937652587891 L 8.981213569641113 9.106706619262695 L 10.72248363494873 10.83979988098145 L 12.4555778503418 9.106706619262695 L 13.60825061798096 10.25937652587891 L 11.87515449523926 11.99247169494629 L 13.60825061798096 13.72556304931641 L 12.4555778503418 14.87823486328125 L 10.72248363494873 13.14514350891113 L 8.989388465881348 14.87823486328125 L 7.836715698242188 13.72556304931641 L 9.56981086730957 11.99247169494629 L 7.828540802001953 10.25937652587891 Z M 13.58372592926025 3.81749701499939 L 12.76622676849365 2.999999046325684 L 8.678738594055176 2.999999046325684 L 7.861240386962891 3.81749701499939 L 5 3.81749701499939 L 5 5.452491760253906 L 16.4449634552002 5.452491760253906 L 16.4449634552002 3.81749701499939 L 13.58372592926025 3.81749701499939 Z" fill="#f35162" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
