import "dart:async";

import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "../mainScreens/main_screen.dart";
import "../widgets/widget.dart";
import "car_segment.dart";
import "controller_center_segment.dart";

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  startTimer() {
    Timer(const Duration(seconds: 1), () async {
      //send user to home screen
      Navigator.push(context, MaterialPageRoute(builder: (c) => MainScreen()));
    });
  }

  bool isHeadLightTurnedOn = false;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ///Showing status & navigation bars on android
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: SystemUiOverlay.values);
        Widgets.pop(context);
        return true;
      },
      child: Scaffold(
        body: splitedBody(),
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget splitedBody() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarSegment(
          isHeadLightTurnedOn: isHeadLightTurnedOn,
        ),
        ControllerCenterSegment(
          isHeadLightTurnedOn: isHeadLightTurnedOn,
          onChanged: (z) {
            if (mounted) setState(() => isHeadLightTurnedOn = z);
          },
        ),
      ],
    );
  }
}
