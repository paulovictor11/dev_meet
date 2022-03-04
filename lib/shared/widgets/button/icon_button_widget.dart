import 'package:flutter/material.dart';

import 'package:devmeet/shared/theme/app_colors.dart';

class IconButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final double radius;
  final VoidCallback onTap;

  const IconButtonWidget({
    Key? key,
    this.height = 56,
    this.width = 56,
    this.color = PrimaryColors.$orange,
    this.iconColor = PrimaryColors.$white,
    this.iconSize = 28,
    this.radius = 16,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
