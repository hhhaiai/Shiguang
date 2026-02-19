import 'package:flutter/material.dart';

class EdgeSwipeBack extends StatefulWidget {
  final Widget child;
  final bool enabled;
  final double edgeWidth;
  final double triggerDistance;
  final double triggerVelocity;

  const EdgeSwipeBack({
    super.key,
    required this.child,
    this.enabled = true,
    this.edgeWidth = 24,
    this.triggerDistance = 120,
    this.triggerVelocity = 800,
  });

  @override
  State<EdgeSwipeBack> createState() => _EdgeSwipeBackState();
}

class _EdgeSwipeBackState extends State<EdgeSwipeBack> {
  bool _tracking = false;
  double _deltaX = 0;
  double _deltaY = 0;

  void _reset() {
    _tracking = false;
    _deltaX = 0;
    _deltaY = 0;
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragStart: (details) {
        if (!widget.enabled) return;
        if (details.globalPosition.dx <= widget.edgeWidth) {
          _tracking = true;
          _deltaX = 0;
          _deltaY = 0;
        }
      },
      onHorizontalDragUpdate: (details) {
        if (!_tracking) return;
        _deltaX += details.delta.dx;
        _deltaY += details.delta.dy.abs();
      },
      onHorizontalDragEnd: (details) {
        if (!_tracking) return;
        final velocity = details.primaryVelocity ?? 0;
        final shouldPop = _deltaX > widget.triggerDistance &&
            _deltaY < widget.triggerDistance &&
            velocity > 0;
        final fastSwipe = velocity > widget.triggerVelocity;
        if (shouldPop || fastSwipe) {
          Navigator.of(context).maybePop();
        }
        _reset();
      },
      onHorizontalDragCancel: _reset,
      child: widget.child,
    );
  }
}
