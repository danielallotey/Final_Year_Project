import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import '../pages/social_amenities.dart';
import 'package:adobe_xd/page_link.dart';
import '../components/service_needed_input.dart';
import '../components/regular_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
            Pin(start: 31.0, end: 31.0),
            Pin(size: 43.0, end: 80.0),
            child:
            // Adobe XD layer: 'Social Amenities Bu…' (group)
            PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.easeInOutExpo,
                  duration: 1.0,
                  pageBuilder: () => SocialAmenities(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0x57ffffff),
                      borderRadius: BorderRadius.circular(22.0),
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
                    Pin(size: 204.0, start: 41.0),
                    Pin(size: 21.0, middle: 0.4545),
                    child: Text(
                      'Browse Social Amenities',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                        letterSpacing: 1.05,
                        height: 1.2666666666666666,
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
          ),
          Pinned.fromPins(
            Pin(start: 31.0, end: 31.0),
            Pin(size: 45.0, middle: 0.7093),
            child:
            // Adobe XD layer: 'Search Button' (group)
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfff64743),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                Align(
                  alignment: Alignment(0.004, 0.0),
                  child: SizedBox(
                    width: 62.0,
                    height: 23.0,
                    child: Text(
                      'Search',
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
            Pin(start: 31.0, end: 31.0),
            Pin(size: 45.0, middle: 0.6375),
            child:
            // Adobe XD layer: 'Community Input' (component)
            ServiceNeededInput(),
          ),
          Pinned.fromPins(
            Pin(start: 56.0, end: 55.0),
            Pin(size: 63.0, middle: 0.4152),
            child: Text(
              'Get connected to a local\nprofessional - fast, easy, and\ncommitment-free.',
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
          Pinned.fromPins(
            Pin(start: 43.0, end: 42.0),
            Pin(size: 149.0, middle: 0.2112),
            child: Text(
              'Find Someone\nNear You\nTo Do It For You',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 35,
                color: const Color(0xffffffff),
                letterSpacing: 1.4000000000000001,
                fontWeight: FontWeight.w600,
                height: 1.4285714285714286,
                shadows: [
                  Shadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  )
                ],
              ),
              textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 65.0, start: 0.0),
            child:
            // Adobe XD layer: 'Regular Top Bar' (component)
            RegularTopBar(),
          ),
          Pinned.fromPins(
            Pin(start: 31.0, end: 31.0),
            Pin(size: 45.0, middle: 0.5658),
            child:
            // Adobe XD layer: 'Service Needed Input' (component)
            ServiceNeededInput(),
          ),
        ],
      ),
    );
  }
}
