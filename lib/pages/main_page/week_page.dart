
import 'dart:ui';

import 'package:adobe_xd/page_link.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../content_views/child_widgets.dart';

/*class Component401 extends StatelessWidget {
  Component401({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 22.0,
            height: 19.0,
            child: Text(
              'Oy',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 17,
                color: const Color(0xfffc3b2d),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(start: 0.0, end: 0.0),
          Pin(size: 38.0, start: 0.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(''),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Component411 extends StatelessWidget {
  const Component411({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromPins(
          Pin(start: 4.0, end: 4.0),
          Pin(size: 19.0, end: 0.0),
          child: Text(
            'Kun',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 17,
              color: const Color(0xff666666),
            ),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
        ),
        Pinned.fromPins(
          Pin(start: 0.0, end: 0.0),
          Pin(size: 38.0, start: 0.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(''),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Component421 extends StatelessWidget {
  const Component421({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromPins(
          Pin(start: 0.0, end: 0.0),
          Pin(size: 19.0, end: 0.0),
          child: Text(
            'Hafta',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 17,
              color: const Color(0xff666666),
            ),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
        ),
        Pinned.fromPins(
          Pin(start: 1.0, end: 1.0),
          Pin(size: 38.0, start: 0.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(''),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
*/

class WeekPage extends StatefulWidget{
  @override
  State<WeekPage> createState()  => _WeekPage();
}

DateTime get _now => DateTime.now();
class _WeekPage extends State<WeekPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Expanded(
                child: CalendarControllerProvider(
                  controller: EventController(),
                  child: MaterialApp(
                    home: Scaffold(
                      body: MonthView(
                        weekDayBuilder: (int index) {
                          final day = [
                            'Du',
                            'Se',
                            'Ch',
                            'Pa',
                            'Ju',
                            'Sh',
                            'Ya'
                          ];
                          return Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8.0),
                            child: Text(day[index]),
                          );
                        },
                      ),
                      /*body: WeekView(
              weekDayStringBuilder: (int index) {
              final day = ['Du', 'Se', 'Ch', 'Pa', 'Ju', 'Sh', 'Ya'];
              return day[index];
            },
            timeLineStringBuilder: (DateTime time, {DateTime? secondaryDate}) {
              return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
            },
            ),*/
                      //body: DayView(),
                    ),
                  ),
                )
            ),
            //SizedBox(height: 250,),
            saveButton(col: Colors.red,
                onPressedCallBack: () {

                }
            ),
          ],
        )
    );
  }
}

/*
saveButton(col: Colors.red,
              onPressedCallBack: () {}
          ),
* */

/*class _WeekPage extends State<WeekPage>{
  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(size: 108.0, end: -10.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    color: const Color(0xfff0f4f9),
                    margin: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 10.0),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 1.0, start: 17.0),
                    child: SvgPicture.string(
                      _svg_mg3fa4,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(),
                  Align(
                    alignment: Alignment(-0.004, 0.174),
                    child: SizedBox(
                      width: 38.0,
                      height: 62.0,
                      child: PageLink(
                        links: [
                          PageLinkInfo(
                            duration: 1,
                            pageBuilder: () => Container(color: Colors.red,)//kun(),
                          ),
                        ],
                        child: Component411(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.434, 0.174),
                    child: SizedBox(
                      width: 42.0,
                      height: 62.0,
                      child: Component421(),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 38.0, start: 38.0),
                    Pin(size: 62.0, middle: 0.587),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          duration: 1,
                          pageBuilder: () => Container(color: Colors.red,)//oy(),
                        ),
                      ],
                      child: Component401(),
                    ),
                  ),
                  Container(),
                  Pinned.fromPins(
                    Pin(size: 71.0, middle: 0.2713),
                    Pin(size: 2.0, start: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-1.0, 0.0),
                          end: Alignment(1.0, 0.0),
                          colors: [
                            const Color(0xffc5c5c5),
                            const Color(0xfffc3b2d),
                            const Color(0xffc5c5c5)
                          ],
                          stops: [0.0, 0.5, 1.0],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 101.0, 0.0, 82.0),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(size: 25.0, end: 0.0),
                    child: Container(
                      color: const Color(0xffffffff),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 69.0, middle: 0.5779),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      color: const Color(0x1afc3b2d),
                    ),
                  ),
                  Container(),
                  Container(),
                  Container(),
                  Pinned.fromPins(
                    Pin(size: 419.0, end: 4.0),
                    Pin(start: 52.5, end: 0.0),
                    child: Stack(
                      children: <Widget>[
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                        Container(),
                      ],
                    ),
                  ),
                  Container(),
                  Pinned.fromPins(
                    Pin(size: 70.0, middle: 0.5781),
                    Pin(size: 1.0, start: 0.5),
                    child: SvgPicture.string(
                      _svg_xwc0p4,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(start: 27.0, end: 16.0),
              Pin(size: 46.0, start: 23.0),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 36.0, start: 0.0),
                    Pin(start: 5.0, end: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage(''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 172.0, middle: 0.2659),
                    Pin(size: 33.0, end: 6.0),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 30,
                          color: const Color(0xff118ab2),
                        ),
                        children: [
                          TextSpan(
                            text: 'yanvar ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: '2023',
                          ),
                        ],
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 36.0, middle: 0.66),
                    Pin(start: 5.0, end: 5.0),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          duration: 1,
                          pageBuilder: () => Container(color: Colors.red,)//order(),
                        ),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 36.0, middle: 0.8249),
                    Pin(start: 5.0, end: 5.0),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          duration: 1,
                          pageBuilder: () => Container(color: Colors.red,)//search(),
                        ),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(''),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 46.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(color: Colors.red,)//Avatar(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}

const String _svg_mg3fa4 =
    '<svg viewBox="0.0 1079.0 576.0 1.0" ><path transform="translate(0.0, 1079.0)" d="M 0 0 L 576 0" fill="none" stroke="#c5c5c5" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xwc0p4 =
    '<svg viewBox="292.5 101.5 70.0 1.0" ><path transform="translate(292.5, 101.5)" d="M 0 0 L 70 0" fill="none" stroke="#cbcbcb" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
*/