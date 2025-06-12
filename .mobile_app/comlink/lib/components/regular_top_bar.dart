import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegularTopBar extends StatelessWidget {
  const RegularTopBar({
    super.key
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromPins(
          Pin(start: 0.0, end: 0.0),
          Pin(size: 65.0, start: 0.0),
          child: Container(
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
        ),
        Pinned.fromPins(
          Pin(size: 119.0, start: 20.0),
          Pin(size: 35.0, start: 21.0),
          child: Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                color: const Color(0xff000000),
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
          Pin(size: 20.0, middle: 0.6),
          child:
              // Adobe XD layer: 'open' (group)
              Stack(
            children: <Widget>[
              Pinned.fromPins(
                Pin(size: 30.0, end: 0.0),
                Pin(size: 1.0, middle: 0.0),
                child: SvgPicture.string(
                  _svg_g14lct,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 30.0, end: 0.0),
                Pin(size: 1.0, middle: 0.5263),
                child: SvgPicture.string(
                  _svg_ntwit,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 30.0, end: 0.0),
                Pin(size: 1.0, middle: 1.0526),
                child: SvgPicture.string(
                  _svg_hcseef,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: constant_identifier_names
const String _svg_g14lct =
    '<svg viewBox="322.0 27.0 30.0 1.0" ><path transform="translate(322.0, 27.0)" d="M 0 0 L 30 0" fill="none" stroke="#000000" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_ntwit =
    '<svg viewBox="322.0 37.0 30.0 1.0" ><path transform="translate(322.0, 37.0)" d="M 0 0 L 30 0" fill="none" stroke="#000000" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_hcseef =
    '<svg viewBox="322.0 47.0 30.0 1.0" ><path transform="translate(322.0, 47.0)" d="M 0 0 L 30 0" fill="none" stroke="#000000" stroke-width="3" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
