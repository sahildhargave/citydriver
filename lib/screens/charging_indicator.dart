import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import '../widgets/widget.dart';
import 'black_icon_button.dart';

class ChargingIndicator extends StatefulWidget {
  const ChargingIndicator({super.key});

  @override
  State<ChargingIndicator> createState() => _ChargingIndicatorState();
}

class _ChargingIndicatorState extends State<ChargingIndicator>
    with SingleTickerProviderStateMixin {
  static const double defaultCharge = 0.575;

  ///It was 0.32 on older method
  static const Duration chargingDuration = Duration(seconds: 5);
  // double charge = defaultCharge;

  double get charge => animation.value;

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: chargingDuration);
    animation = Tween(begin: 1.0, end: 0.0).animate(animationController)
      ..addListener(() {
        if (mounted) setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          indicationWaves(),
          const Padding(
              padding: EdgeInsets.only(left: 110),
              child: Text(
                "Start",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          BlackIconButton(
            icon: Icons.power_settings_new_outlined,
            onTap: animateChargeFn,
          ),
        ],
      ),
    );
  }

  Widget indicationWaves() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: RotatedBox(
        quarterTurns: 1,
        child: SizedBox(
          height: Widgets.mwidth(context) / 1.35,
          width: 72.5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              bottomWaves(),
              topGradient(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomWaves() {
    return WaveWidget(
      backgroundColor: TeslaColorz.disabledGrey,
      config: CustomConfig(
        colors: TeslaColorz.chargingWaveColors,
        durations: [
          18000,
          8000,
          5000,
          12000,
        ],
        heightPercentages: [
          charge,
          charge + 0.01,
          charge + 0.02,
          charge + 0.03,
        ],
      ),
      size: Size(double.infinity, double.infinity),
      waveAmplitude: 5,
    );
  }

  Widget topGradient() {
    return AnimatedContainer(
      duration: Widgets.duration,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            TeslaColorz.chargingWaveColors.first.withOpacity(0.5),
            TeslaColorz.chargingBlue,
            TeslaColorz.chargingBlue.withOpacity(0.1),
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ),
      ),
    );
  }

  void animateChargeFn() async {
    if (animationController.isAnimating == false) {
      animationController.forward();
      await Widgets.wait(chargingDuration.inMilliseconds * 2);
      animationController.animateTo(defaultCharge);
    } else {
      //Animation is already processing....
    }
  }
}
