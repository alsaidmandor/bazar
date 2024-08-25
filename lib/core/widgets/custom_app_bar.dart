import 'package:flutter/material.dart';


import '../theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData leadingIcon;
  final IconData actionIcon;
  final String titleText;
  final Color leadingIconColor;
  final Color actionIconColor;
  final EdgeInsetsGeometry leadingPadding;
  final EdgeInsetsGeometry actionPadding;
  final TextStyle titleStyle;
  final VoidCallback onLeadingIconPressed;
  final VoidCallback onActionIconPressed;

  const CustomAppBar({super.key,
    required this.leadingIcon,
    required this.actionIcon,
    required this.titleText,
    this.leadingIconColor = AppColor.greyScale900,
    this.actionIconColor = AppColor.greyScale900,
    this.leadingPadding = const EdgeInsets.all(8.0),
    this.actionPadding = const EdgeInsets.all(8.0),
    this.titleStyle = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
    required this.onLeadingIconPressed,
    required this.onActionIconPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: leadingPadding,
        child: IconButton(
          icon: Icon(leadingIcon, color: leadingIconColor),
          onPressed: onLeadingIconPressed,
        ),
      ),
      actions: [
        Padding(
          padding: actionPadding,
          child: IconButton(
            icon: Icon(actionIcon, color: actionIconColor),
            onPressed: onActionIconPressed,
          ),
        ),
      ],
      title: Text(
        titleText,
        style: titleStyle,
      ),
    );
  }
}


