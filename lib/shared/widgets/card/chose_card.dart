import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:devmeet/shared/theme/app_colors.dart';

class ChoseCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String total;
  final Color borderColor;
  final VoidCallback onTap;

  const ChoseCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.total,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 163,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: PrimaryColors.$white,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            width: 3,
            color: borderColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            const SizedBox(height: 22),
            Text(
              title,
              style: GoogleFonts.epilogue(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: GreyColors.$background,
              ),
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                text: '$total eventos',
                style: GoogleFonts.epilogue(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: PrimaryColors.$orange,
                ),
                children: [
                  TextSpan(
                    text: ' encontrados',
                    style: GoogleFonts.epilogue(
                      color: PrimaryColors.$grey,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
