import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final Widget? child;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? colorBorderSide;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final bool? isBorderSide;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    this.isBorderSide = false,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    this.colorBorderSide = Colors.grey,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
            side: isBorderSide!
                ? BorderSide(
                    color: colorBorderSide!,
                  )
                : BorderSide.none,
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          isBorderSide!
              ? Colors.transparent
              : backgroundColor ?? Theme.of(context).primaryColor,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.h),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: child ??
            Text(
              textAlign: TextAlign.center,
              buttonText,
              style: textStyle,
            ),
      ),
    );
  }
}
