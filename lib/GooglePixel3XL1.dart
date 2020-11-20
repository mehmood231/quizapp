import 'package:flutter/material.dart';
import './Component11.dart';

class GooglePixel3XL1 extends StatelessWidget {
  GooglePixel3XL1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: 412.0,
            height: 672.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200.0),
              ),
              color: const Color(0xff575bdb),
              border: Border.all(width: 5.0, color: const Color(0xff070707)),
            ),
          ),
          Transform.translate(
            offset: Offset(81.0, 57.0),
            child: SizedBox(
              width: 241.0,
              height: 242.0,
              child: Component11(),
            ),
          ),
          Transform.translate(
            offset: Offset(24.0, 380.0),
            child: SizedBox(
              width: 376.0,
              height: 41.0,
              child: Text(
                'splash screen by ahsan',
                style: TextStyle(
                  fontFamily: 'Consolas',
                  fontSize: 26,
                  color: const Color(0xffeb2e10),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(226.0, 726.0),
            child: Text(
              '',
              style: TextStyle(
                fontFamily: 'Symbol',
                fontSize: 26,
                color: const Color(0xffeb2e10),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 666.0),
            child: Container(
              width: 412.0,
              height: 165.0,
              decoration: BoxDecoration(
                color: const Color(0xffe20505),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-16.0, 726.0),
            child: SizedBox(
              width: 446.0,
              height: 53.0,
              child: Text(
                'QUIZ APP FLUTTER',
                style: TextStyle(
                  fontFamily: 'MS Gothic',
                  fontSize: 30,
                  color: const Color(0xff0c0201),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
