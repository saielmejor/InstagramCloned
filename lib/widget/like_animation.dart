import 'package:flutter/material.dart';

class LikeAnimationState extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration; // how long duration
  final VoidCallback? onEnd; // end like animation
  final bool smallLike; //verify if like was clicked or not

  const LikeAnimationState(
      {Key? key,
      required this.child,
      required this.isAnimating,
      this.duration = const Duration(milliseconds: 150),
      this.onEnd,
      this.smallLike = false})
      : super(key: key);

  @override
  State<LikeAnimationState> createState() => _LikeAnimationStateState();
}

class _LikeAnimationStateState extends State<LikeAnimationState>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(microseconds: widget.duration.inMilliseconds ~/ 2),
    );
    //divides duration in 2 by milleseconds

    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant LikeAnimationState oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating != oldWidget.isAnimating) {
      startAnimation();
    }
  }

  startAnimation() async {
    if (widget.isAnimating || widget.smallLike) {
      await controller.forward();
      await controller.reverse();
      await Future.delayed(
        const Duration(
          milliseconds: 200,
        ),
      );
      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    }
  }

//dispose controller
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: scale, child: widget.child);
  }
}
