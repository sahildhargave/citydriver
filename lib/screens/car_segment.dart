import 'dart:core';
import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:may/constants/colors.dart';

import '../constants/assets.dart';
import '../widgets/widget.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/state.dart';
//import '../widgets/widget.dart';
//import 'package:flutter/src/widgets/button.

class CarSegment extends StatefulWidget {
  final bool isHeadLightTurnedOn;
  const CarSegment({
    Key? key,
    required this.isHeadLightTurnedOn,
  }) : super(key: key);

  @override
  _CarSegmentState createState() => _CarSegmentState();
}

class _CarSegmentState extends State<CarSegment> {
  bool get _isOn => widget.isHeadLightTurnedOn;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: Widgets.mheight(context) / 1.25,
        width: Widgets.mwidth(context),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: TeslaColorz.backdropColors,
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        )),
        padding: const EdgeInsets.only(top: 65),
        child: Column(
          children: [
            title(),
            modelChip(),
            carStack(),
          ],
        ),
      )
    ]);
  }

  Widget title() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Text(
          "You Are \nReady To Go!",
          textAlign: TextAlign.center,
          //color:Colors.white,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget modelChip() {
    return Container(
        height: 32.5,
        width: 125,
        margin: const EdgeInsets.only(top: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(90),
        ),
        child: const Text(
          "Tesla model 5",
          style: TextStyle(
            color: Colors.white70,
          ),
        ));
  }

  Widget carStack() {
    return Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 25,
          right: 25,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            darkenCar(),
            glowingCarBody(),
            glowingLight(),
          ],
        ));
  }

  Widget glowingCarBody() {
    return AnimatedOpacity(
        opacity: _isOn ? 1 : 0,
        duration: Widgets.duration1Sec,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.white,
            BlendMode.srcATop,
          ),
          child: Image.asset(TeslaAssets.body),
        ));
  }

  Widget darkenCar() {
    return ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(_isOn ? 0 : 0.25),
          BlendMode.srcATop,
        ),
        child: Image.asset(TeslaAssets.car));
  }

  Widget glowingLight() {
    final double val = _isOn ? 2.75 : 0;
    return AnimatedOpacity(
        opacity: _isOn ? 1 : 0,
        duration: Widgets.duration3Sec,
        child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: val, sigmaY: val),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              child: Image.asset(TeslaAssets.lights),
            )));
  }
}
