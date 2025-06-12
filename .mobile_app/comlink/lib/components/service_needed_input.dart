import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceNeededInput extends StatelessWidget {
  ServiceNeededInput({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromPins(
          Pin(start: 0.0, end: 0.0),
          Pin(size: 45.0, start: 0.0),
          child:
              // Adobe XD layer: 'button' (group)
              Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(7.0),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff000000)),
                ),
              ),
              Pinned.fromPins(
                Pin(size: 140.0, start: 20.0),
                Pin(size: 23.0, middle: 0.5),
                child: Text(
                  'Service Needed',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: const Color(0xffb8aaaa),
                    letterSpacing: 1.12,
                    height: 1.25,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 9.2, end: 25.8),
                Pin(size: 18.0, middle: 0.5185),
                child:
                    // Adobe XD layer: 'ic_unfold_more_24px' (shape)
                    SvgPicture.string(
                  _svg_cqr,
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

const String _svg_cqr =
    '<svg viewBox="278.0 14.0 9.2 18.0" ><path transform="translate(270.59, 11.0)" d="M 12 5.829999923706055 L 15.17000007629395 9 L 16.57999992370605 7.590000152587891 L 12 3 L 7.409999847412109 7.590000152587891 L 8.829999923706055 9 L 12 5.829999923706055 Z M 12 18.17000007629395 L 8.829999923706055 15 L 7.420000076293945 16.40999984741211 L 12 21 L 16.59000015258789 16.40999984741211 L 15.17000007629395 15 L 12 18.17000007629395 Z" fill="#95989a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
