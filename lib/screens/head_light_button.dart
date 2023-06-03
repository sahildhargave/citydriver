import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../constants/colors.dart';
import '../widgets/Inkk.dart';
import '../widgets/widget.dart';

class HeadLightButton extends StatelessWidget {
  final bool isHeadLightTurnedOn;

  final Function(bool) onChanged;

  const HeadLightButton(
      {super.key, required this.isHeadLightTurnedOn, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final double defaultHeight = 120;
    final double defaultWidth = 75;
    final Color color = isHeadLightTurnedOn
        ? TeslaColorz.headLightRed
        : TeslaColorz.disabledGrey;

    return Inkk(
      radius: 18,
      spalshColor: Colors.white70,
      onTap: turnOnOff,
      child: AnimatedContainer(
        duration: Widgets.duration,
        height: defaultHeight,
        width: defaultWidth,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        alignment: Alignment.center,
        child: AnimatedOpacity(
          duration: Widgets.duration,
          opacity: isHeadLightTurnedOn ? 1 : 0.4,
          child: ImageIcon(
            AssetImage(
              TeslaAssets.headLightIcon,
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void turnOnOff() {
    onChanged(!isHeadLightTurnedOn);
  }
}
