import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 0.5, color: const Color(0xff000000)),
          ),
        ),
        Align(
          alignment: Alignment(0.074, 0.024),
          child: SizedBox(
            width: 147.0,
            height: 48.0,
            child:
                // Adobe XD layer: 'info' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 20.0, start: 0.0),
                  child: Text(
                    'Mohammed Muniru',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: const Color(0xff215066),
                      letterSpacing: 0.28,
                      fontWeight: FontWeight.w700,
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-1.0, 0.29),
                  child: SizedBox(
                    width: 108.0,
                    height: 17.0,
                    child: Text(
                      'Dentist Specialist',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: const Color(0xff215066),
                        letterSpacing: 0.24,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: 63.0,
                    height: 11.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 8,
                          color: const Color(0xff215066),
                          letterSpacing: 0.16,
                        ),
                        children: [
                          TextSpan(
                            text: '543',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' Bookmarks',
                          ),
                        ],
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 71.0, start: 9.0),
          Pin(start: 9.0, end: 9.0),
          child:
              // Adobe XD layer: 'avatar' (shape)
              Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/avatar.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            ),
          ),
        ),
      ],
    );
  }
}
