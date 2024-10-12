import 'package:flutter/material.dart';
import 'package:one_call_app/app/config/ColorConfig.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class CircleEmergency extends StatelessWidget {
  final Function onTapDown;
  final Function onTapCancel;
  final Function onTapUp;
  final double minRadius;
  final bool isShowText;
  const CircleEmergency({
    super.key,
    this.isShowText = true,
    required this.minRadius,
    required this.onTapDown,
    required this.onTapCancel,
    required this.onTapUp,
  });

  @override
  Widget build(BuildContext context) {
    return RippleAnimation(
      repeat: true,
      color: ColorConfig.primaryColor.withOpacity(0.3),
      minRadius: minRadius,
      ripplesCount: 6,
      duration: const Duration(seconds: 3),
      child: GestureDetector(
        onTapDown: (details) {
          onTapDown();
        },
        onTapCancel: () {
          onTapCancel();
        },
        onTapUp: (details) {
          onTapUp();
        },
        child: Container(
          padding: const EdgeInsets.all(30),
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                ColorConfig.primaryColor.withOpacity(0.65),
                ColorConfig.primaryColor.withOpacity(0.9),
                ColorConfig.primaryColor
              ]),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: ColorConfig.primaryColor.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "SOS",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isShowText
                    ? const Text(
                        "Tekan 3 detik",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
