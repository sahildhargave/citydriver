import 'package:flutter/material.dart';
import 'package:may/widgets/widget.dart';

import 'charging_indicator.dart';
import 'head_light_button.dart';

class ControllerCenterSegment extends StatelessWidget {
  final bool isHeadLightTurnedOn;

  ///Going to be executed when the button is pressed
  final Function(bool) onChanged;
  const ControllerCenterSegment(
      {required this.isHeadLightTurnedOn, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Widgets.mheight(context) / 3,
        width: double.maxFinite,
        child: Row(
          children: [
            leftSegment(),
          ],
        ));
  }

  Widget leftSegment() {
    return Expanded(
        child: Column(
      children: [
        buttonsRow(),
        const ChargingIndicator(),
      ],
    ));
  }

  Widget buttonsRow() {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        HeadLightButton(
          isHeadLightTurnedOn: isHeadLightTurnedOn,
          onChanged: onChanged,
        ),
      ],
    ));
  }
}
