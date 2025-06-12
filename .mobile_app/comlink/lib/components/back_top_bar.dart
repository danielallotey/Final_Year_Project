import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import '../pages/business_signup.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackTopBar extends StatelessWidget {
  const BackTopBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: const Color(0x33000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        Pinned.fromPins(
          Pin(size: 89.8, start: 19.2),
          Pin(size: 35.0, middle: 0.7),
          child: PageLink(
            links: [
              PageLinkInfo(
                ease: Curves.easeInOutExpo,
                duration: 1.0,
                pageBuilder: () => BusinessSignup(),
              ),
            ],
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 65.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      color: const Color(0xff000000),
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 14.8, start: 0.0),
                  Pin(start: 4.0, end: 7.0),
                  child:
                      // Adobe XD layer: 'ic_keyboard_arrow_l…' (shape)
                      SvgPicture.string(
                    _svg_b2qs,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: constant_identifier_names
const String _svg_b2qs =
    '<svg viewBox="19.2 25.0 14.8 24.0" ><path transform="translate(11.18, 19.5)" d="M 22.81547737121582 26.67353820800781 L 13.65827178955078 17.496337890625 L 22.81547737121582 8.31913948059082 L 19.996337890625 5.5 L 8 17.496337890625 L 19.996337890625 29.49267578125 L 22.81547737121582 26.67353820800781 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
