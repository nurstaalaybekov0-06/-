import 'package:flutter/material.dart';

class ProductArtwork extends StatelessWidget {
  const ProductArtwork({
    super.key,
    required this.colors,
    this.imageAsset,
    this.rounded = true,
  });

  final List<Color> colors;
  final String? imageAsset;
  final bool rounded;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: rounded ? BorderRadius.circular(12) : BorderRadius.zero,
      child: imageAsset != null
          ? Image.asset(imageAsset!, fit: BoxFit.cover)
          : DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colors[0], colors[1]],
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: -8,
                    left: -12,
                    child: _GlowBlob(color: colors[3], size: 110),
                  ),
                  Positioned(
                    top: 12,
                    right: 30,
                    child: _GlowBlob(color: colors[2], size: 78),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 18,
                    child: Container(
                      width: 170,
                      height: 96,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.35),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 68,
                    top: 52,
                    child: Transform.rotate(
                      angle: -0.35,
                      child: Container(
                        width: 118,
                        height: 118,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              const Color(0xFFF0E8D6),
                              colors[1].withValues(alpha: 0.65),
                              const Color(0xFF1B1B1F),
                            ],
                            stops: const [0.15, 0.58, 1],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.35),
                              blurRadius: 14,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withValues(alpha: 0.55),
                              border: Border.all(color: Colors.white30, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 34,
                    child: Transform.rotate(
                      angle: 0.18,
                      child: Container(
                        width: 108,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(52),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFF7F4EE),
                              Color(0xFFC6C4BF),
                              Color(0xFF38383D),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.28),
                              blurRadius: 14,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _GlowBlob extends StatelessWidget {
  const _GlowBlob({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.9),
            blurRadius: 38,
            spreadRadius: 8,
          ),
        ],
      ),
    );
  }
}
