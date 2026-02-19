import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Polished live waveform bars for voice capture UI.
class LiveWaveformBars extends StatelessWidget {
  final List<double> samples;
  final bool compact;

  const LiveWaveformBars({
    super.key,
    required this.samples,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final primary = colorScheme.primary;
    final secondary = colorScheme.tertiary;

    final maxHeight = compact ? 26.0 : 72.0;
    final minHeight = compact ? 5.0 : 9.0;
    final barWidth = compact ? 3.0 : 4.2;
    final smooth = _smoothSamples(samples);

    return Container(
      height: maxHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(compact ? 12 : 18),
        border: Border.all(color: primary.withValues(alpha: 0.12)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primary.withValues(alpha: compact ? 0.08 : 0.1),
            colorScheme.surface.withValues(alpha: compact ? 0.5 : 0.34),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(compact ? 12 : 18),
                  gradient: RadialGradient(
                    center: const Alignment(0, -0.4),
                    radius: 1.2,
                    colors: [
                      secondary.withValues(alpha: compact ? 0.06 : 0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: compact ? 8 : 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(smooth.length, (index) {
                final level = smooth[index].clamp(0.0, 1.0);
                final centerDistance =
                    (index - (smooth.length - 1) / 2).abs() /
                    ((smooth.length - 1) / 2);
                final centerWeight = 1.0 - centerDistance * 0.25;

                final height =
                    minHeight +
                    (maxHeight - minHeight) *
                        (0.14 + level * 0.86) *
                        centerWeight;
                final top = Color.lerp(primary, secondary, 0.36)!;

                return SizedBox(
                  width: barWidth + 2,
                  child: Center(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: minHeight, end: height),
                      duration: const Duration(milliseconds: 120),
                      curve: Curves.easeOutCubic,
                      builder: (context, animatedHeight, _) {
                        return Container(
                          width: barWidth,
                          height: animatedHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                top.withValues(alpha: compact ? 0.82 : 0.9),
                                primary.withValues(alpha: compact ? 0.9 : 0.98),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: primary.withValues(alpha: 0.22),
                                blurRadius: compact ? 4 : 6,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  List<double> _smoothSamples(List<double> input) {
    if (input.isEmpty) return const [0.02];

    final output = List<double>.filled(input.length, 0.02);
    for (var i = 0; i < input.length; i++) {
      final a = i > 0 ? input[i - 1] : input[i];
      final b = input[i];
      final c = i < input.length - 1 ? input[i + 1] : input[i];
      final weighted = a * 0.22 + b * 0.56 + c * 0.22;
      output[i] = math.max(0.02, weighted);
    }
    return output;
  }
}
