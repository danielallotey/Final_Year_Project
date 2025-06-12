import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './completed.dart';
import 'package:adobe_xd/page_link.dart';
import '../components/back_top_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Step2 extends StatelessWidget {
  const Step2({
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
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(9.0),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
            margin: EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 20.0),
          ),
          Pinned.fromPins(
            Pin(start: 37.0, end: 36.0),
            Pin(size: 45.0, middle: 0.2999),
            child:
                // Adobe XD layer: 'Business Desc' (group)
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
                  Pin(size: 185.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Business Description',
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
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 37.0, end: 36.0),
            Pin(size: 45.0, middle: 0.4694),
            child:
                // Adobe XD layer: 'Business Phone' (group)
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
                  Pin(size: 138.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Business Phone',
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
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 37.0, end: 36.0),
            Pin(size: 45.0, end: 70.0),
            child:
                // Adobe XD layer: 'Submit' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.easeInOutExpo,
                  duration: 1.0,
                  pageBuilder: () => Completed(),
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
          ),
          Pinned.fromPins(
            Pin(size: 46.0, end: 36.0),
            Pin(size: 16.0, end: 36.0),
            child: Text(
              'Step 2/2',
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
            Pin(size: 45.0, middle: 0.6389),
            child:
                // Adobe XD layer: 'Location' (group)
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
                  Pin(size: 76.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Location',
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
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 37.0, end: 36.0),
            Pin(size: 45.0, middle: 0.3846),
            child:
                // Adobe XD layer: 'Emai Address' (group)
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
                  Pin(size: 126.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Email Address',
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
            Pin(size: 45.0, middle: 0.5541),
            child:
                // Adobe XD layer: 'Business Phone #2' (group)
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
                  Pin(size: 168.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Business Phone #2',
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
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 104.7, middle: 0.4994),
            Pin(size: 104.7, start: 105.0),
            child:
                // Adobe XD layer: 'ic_account_circle_2…' (shape)
                SvgPicture.string(
              _svg_ik76,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 37.0, end: 36.0),
            Pin(size: 45.0, middle: 0.7236),
            child:
                // Adobe XD layer: 'Business Address' (group)
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
                  Pin(size: 155.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Business Address',
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
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 10.0, start: 37.0),
            Pin(size: 10.0, middle: 0.7731),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 282.0, end: 36.0),
            Pin(size: 11.0, middle: 0.774),
            child: Text(
              'I confirm I own/manage this business',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8,
                color: const Color(0xff000000),
                letterSpacing: 0.08,
                fontStyle: FontStyle.italic,
                height: 1.875,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 282.0, end: 36.0),
            Pin(size: 26.0, middle: 0.8155),
            child: Text(
              ',By clicking "Submit" you agree to our Terms & Conditions and Privacy Policy.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 8,
                color: const Color(0xff000000),
                letterSpacing: 0.08,
                fontStyle: FontStyle.italic,
                height: 1.875,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 10.0, start: 37.0),
            Pin(size: 10.0, middle: 0.7993),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
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
const String _svg_ik76 =
    '<svg viewBox="135.0 105.0 104.7 104.7" ><path transform="translate(133.0, 103.0)" d="M 54.33948135375977 2 C 25.44808769226074 2 2 25.44808769226074 2 54.33948135375977 C 2 83.23087310791016 25.44808769226074 106.6789627075195 54.33948135375977 106.6789627075195 C 83.23087310791016 106.6789627075195 106.6789627075195 83.23087310791016 106.6789627075195 54.33948135375977 C 106.6789627075195 25.44808387756348 83.23087310791016 2 54.33948135375977 2 Z M 54.33948135375977 17.70184516906738 C 63.02783584594727 17.70184516906738 70.04132843017578 24.71533584594727 70.04132843017578 33.4036865234375 C 70.04132843017578 42.092041015625 63.02783584594727 49.10552978515625 54.33948135375977 49.10552978515625 C 45.65112686157227 49.10552978515625 38.63763427734375 42.092041015625 38.63763427734375 33.4036865234375 C 38.63763427734375 24.71533584594727 45.65112686157227 17.70184516906738 54.33948135375977 17.70184516906738 Z M 54.33948135375977 92.02391815185547 C 41.25460815429688 92.02391815185547 29.68758583068848 85.32445526123047 22.9357967376709 75.17060089111328 C 23.09281349182129 64.75504302978516 43.87158203125 59.0500373840332 54.33948135375977 59.0500373840332 C 64.75503540039062 59.0500373840332 85.58615112304688 64.75504302978516 85.7431640625 75.17060089111328 C 78.99137878417969 85.32445526123047 67.42435455322266 92.02391815185547 54.33948135375977 92.02391815185547 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
