import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListHandler extends StatelessWidget {
  final List<Widget> children;
  final bool shrinkWrap;
  final bool noScroll;

  AnimatedListHandler({
    @required this.children,
    this.noScroll = false,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: shrinkWrap,
        physics: noScroll ? NeverScrollableScrollPhysics() : null,
        itemCount: children.length,
        itemBuilder: (BuildContext context, int position) {
          return AnimationConfiguration.staggeredList(
            position: position,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: children[position],
              ),
            ),
          );
        },
      ),
    );
  }
}
