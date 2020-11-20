import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class Component11 extends StatelessWidget {
  Component11({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 241.0, 242.0),
          size: Size(241.0, 242.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(126.0),
              image: DecorationImage(
                image: const AssetImage('assets/img1.png'),
                fit: BoxFit.fill,
              ),
              border: Border.all(width: 3.0, color: const Color(0xffe21313)),
            ),
          ),
        ),
      ],
    );
  }
}
