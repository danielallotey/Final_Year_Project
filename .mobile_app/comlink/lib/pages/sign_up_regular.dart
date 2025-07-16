import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import '../components/back_top_bar.dart';

class SignUpRegular extends StatelessWidget {
  const SignUpRegular({
    super.key,
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
            margin: EdgeInsets.fromLTRB(20.0, 101.0, 20.0, 60.0),
          ),
          Pinned.fromPins(
            Pin(start: 37.0, end: 36.0),
            Pin(size: 45.0, end: 99.0),
            child:
                // Adobe XD layer: 'Submit' (group)
                Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff64743),
                    borderRadius: BorderRadius.circular(7.0),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
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
          Pinned.fromPins(
            Pin(size: 10.0, start: 37.0),
            Pin(size: 10.0, middle: 0.707),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 282.0, end: 36.0),
            Pin(size: 71.0, middle: 0.7652),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 8,
                  color: const Color(0xff000000),
                  letterSpacing: 0.08,
                  height: 1.875,
                ),
                children: [
                  TextSpan(
                    text:
                        'By checking this box, I agree the above hone number is accurate and may be used to contact me by a live, autodialed, pre-recorded, or artificial voice call, SMS text and/or email.\nBy clicking "Submit" you agree to our ',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(
                      color: const Color(0xff3583bd),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy.',
                    style: TextStyle(
                      color: const Color(0xff006ea2),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 37.0, end: 36.0),
            Pin(size: 45.0, middle: 0.6545),
            child:
                // Adobe XD layer: 'Confirm Password' (group)
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
                  Pin(size: 162.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Confirm Password',
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
            Pin(size: 45.0, middle: 0.5698),
            child:
                // Adobe XD layer: 'Password' (group)
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
                  Pin(size: 85.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Password',
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
            Pin(size: 45.0, middle: 0.485),
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
            Pin(size: 45.0, middle: 0.4003),
            child:
                // Adobe XD layer: 'Email Address' (group)
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
            Pin(size: 45.0, middle: 0.3155),
            child:
                // Adobe XD layer: 'Phone' (group)
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
                  Pin(size: 54.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Phone',
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
            Pin(size: 45.0, middle: 0.2308),
            child:
                // Adobe XD layer: 'Full Name' (group)
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
                  Pin(size: 88.0, start: 20.0),
                  Pin(size: 23.0, middle: 0.5),
                  child: Text(
                    'Full Name',
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
            Pin(size: 178.0, middle: 0.5025),
            Pin(size: 25.0, start: 122.0),
            child: Text(
              'Create an Account',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: const Color(0xff3583bd),
                letterSpacing: 0.36,
                fontWeight: FontWeight.w600,
                height: 1.1111111111111112,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
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
