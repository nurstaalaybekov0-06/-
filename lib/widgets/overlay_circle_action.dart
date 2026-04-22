import 'package:flutter/material.dart';

class OverlayCircleAction extends StatelessWidget {
  const OverlayCircleAction({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SizedBox(
          width: 18,
          height: 16,
          child: Icon(icon, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}
