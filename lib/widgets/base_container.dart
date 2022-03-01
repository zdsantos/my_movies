import 'package:flutter/material.dart';
import 'package:my_movies/utils/colors.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    Key? key,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
  }) : super(key: key);

  final Widget? child;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final BoxConstraints? constraints;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    Decoration resultDecoration = BoxDecoration(gradient: kBackgroundGradient);

    if (decoration != null) {
      switch (decoration.runtimeType) {
        case BoxDecoration:
          resultDecoration = (decoration as BoxDecoration)
              .copyWith(gradient: kBackgroundGradient);
          break;
        case ShapeDecoration:
          var tempShape = (decoration as ShapeDecoration);

          resultDecoration = ShapeDecoration(
            shape: tempShape.shape,
            color: tempShape.color,
            image: tempShape.image,
            shadows: tempShape.shadows,
            gradient: tempShape.color == null ? kBackgroundGradient : null,
          );
          break;
      }
    }

    return Scaffold(
      body: Container(
        decoration: resultDecoration,
        child: child,
        alignment: alignment,
        padding: padding,
        color: color,
        foregroundDecoration: foregroundDecoration,
        width: width,
        height: height,
        constraints: constraints,
        margin: margin,
        transform: transform,
        transformAlignment: transformAlignment,
      ),
    );
  }
}
