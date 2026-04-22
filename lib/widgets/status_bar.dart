import 'package:flutter/material.dart';

class StatusBarWidget extends StatelessWidget {
  const StatusBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          '9:41',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Icon(Icons.signal_cellular_alt_rounded, color: Colors.white, size: 18),
        SizedBox(width: 6),
        Icon(Icons.wifi_rounded, color: Colors.white, size: 18),
        SizedBox(width: 6),
        BatteryIndicator(),
      ],
    );
  }
}

class BatteryIndicator extends StatelessWidget {
  const BatteryIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white70, width: 1.5),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 24,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
